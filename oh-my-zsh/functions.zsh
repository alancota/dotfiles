################################################################################################
# Credit: some functions copied from the Homebrew install.sh script
# that can be found here: https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
################################################################################################

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

# string formatters
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi

# Custom colors
# Example: echo "${tty_reset}Installing ${tty_bold}${tty_yellow}"${arg}"${tty_reset}${tty_reset}:"
tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_yellow="$(tty_mkbold 93)"
tty_green="$(tty_mkbold 32)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"; do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

chomp() {
  printf "%s" "${1/"$'\n'"/}"
}

warn() {
  printf "${tty_red}Warning${tty_reset}: %s\n" "$(chomp "$1")" >&2
}

p_msg() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

wait_for_user() {
  local c
  echo
  echo "Press ${tty_bold}RETURN${tty_reset}/${tty_bold}ENTER${tty_reset} to continue or any other key to abort:"
  getc c
  # we test for \r and \n because some stuff does \r instead
  if ! [[ "${c}" == $'\r' || "${c}" == $'\n' ]]; then
    exit 1
  fi
}

getc() {
  local save_state
  save_state="$(/bin/stty -g)"
  /bin/stty raw -echo
  IFS='' read -r -n 1 -d '' "$@"
  /bin/stty "${save_state}"
}

# #################################
#   Custom Functions I created    #
# #################################

# ****************************************
# Function to generate random passwords
# ****************************************
gen_random_password() {

  if [ $# -lt 1 ]; then
    echo -e "Password length not specified. Using the default value: 12\n"
    password_len=12
  else
    password_len=$1
  fi

  local RANDPWD=$(openssl rand -base64 $password_len)

  echo -e "Here is your $password_len characters password:\n"
  echo $RANDPWD
  echo -e "\n....................................................."

}

# ****************************************
# Function to generate Docker Secrets
# ****************************************
gen_docsec() {

  # Validating the arguments
  if [ $# != 2 ]; then
    echo -e "Invalid arguments\n"
    echo -e "$0 password_length docker_secret_name\n\n"
    echo -e "Example: generating a 12 character password for a secret called mysql_root_admin_password:\n"
    echo -e "$0 12 mysql_root_admin_password"
    return
  fi

  # check if 1st argument is numeric
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo -e "\nerror: the first argument is not a number: $1"
    return
  fi

  if [[ -z "$2" ]]; then

    echo -e "\nerror: invalid character in the docker secret file name: $2"
    echo -e "only alowed: [a-zA-Z-_0-9]"
    return

  else

    echo \"$(gen_random_password $1)\" | docker secret create $2 - >$2
    echo -e "\nDocker secret created and saved successfully at: $(pwd)/$2\n"
    dsin $2

  fi

}

# **************************************************************************************************************
# This function will install a new Brew package and execute the Homebrew backup right away.
# It's used by the aliases 'bib' (install) and 'bub' (uninstall).
# **************************************************************************************************************
c_brew() {

  brew "$@"
  p_msg "Creating an updated Brewfile backup"
  ${HOMEBREW_BACKUP}/homebrew_backup.sh
  echo "New Brewfile backup successfully created"

}

# **********************************************************
# This custom function automates pushing code to git hub
# by executing git status + commit + push
# **********************************************************
process_arguments() {
  while [ -n "$1" ]; do
    case $1 in
    -h | --help)
      echo "some usage details"
      exit 1
      ;;
    -x)
      do_something
      shift
      break
      ;;
    -y)
      do_something_else
      shift
      break
      ;;
    *)
      echo "some usage details"
      exit 1
      ;;
    esac
    echo $1
    shift
  done
}

# ****************************************************
# Function to push to git repos in one single command
# ****************************************************

c_gitall() {

  # TO-DO: argument parsing
  show_usage() {
    echo -e "Usage: ./$0 -m <github commit message> [-f]
      Perform a Github automation by executing: 'git add .', 'git commit -m <github commit message>' and a 'git push'

      -m, --message,    --message     Github commit message
      -f, -force,       --force       Don't ask for confirmation before pushing code to github"
    return
  }

  # Validating the arguments
  if [ $# -lt 1 ]; then
    show_usage
    return
  fi

  MESSAGE=$1
  FORCE=false

  p_msg="Doing the git stuff..."

  #gaa && gcmsg "${MESSAGE}" && gp
  git add --all && git commit -m "${MESSAGE}" && git push

  echo
  echo "Done: git add . + git commig <msg> + git push"

}

# ****************************************
# Function to start all my stopped ec2s
# ****************************************

start_ec2s() {

  local instances=$(aws ec2 describe-instances --filter Name=instance-state-name,Values=stopped Name=key-name,Values=acota | grep InstanceId | awk '{ print $2 }' | tr -d '",')
  p_msg "This script will start the following EC2 istances:"
  echo "${instances}"
  echo
  read "response?Do you want to continue? [Y/n] "
  response=${response:l}
  if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
    instance_list=""
    for id in $(echo $instances); do
      instance_list+="${id} "
    done
    echo
    p_msg "Starting instances ${instance_list}..."
    echo
    aws ec2 start-instances --instance-ids $(echo $instance_list | xargs)
    echo
    p_msg "Instances successfully started"
  fi

}

# ***********************************************
# Function to create the noname.jks using Java 8
# ***********************************************

create_nnjks() {

  # # Validating the arguments
  # if [ $# -lt 1 ]; then
  #   echo -e "Usage: $0 -h <noname onprem hostname> -p <port> -m <noname mulesoft plugin path>
  #     Automatically creates the noname.jks file with the onprem self signed SSL certificate.

  #     -h, --host,       --host        Noname hostname. Example: nnserver.nonamesec.com
  #     -p, --port,       --port        The HTTPS port. Default: 443
  #     -m, --muleapp,    --muleapp     The absolute path to the unziped Noname MuleSoft Plugin. Example: /Users/acota/Noname/plugins/mulesoft/noname-security-mulesoft-policy"
  #   return
  # fi

  p_msg "Verifying your Java Version"
  java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | awk -F '.' '{print $1$2}')

  # if ["$java_version" -ge 18 ]; then
  #   echo -e "You need to use Java 8 to create the noname.jks. Right now you are running: ${java_version}"
  #   return
  # else
  #   p_msg "Java version is correct: ${java_version}"
  # fi

  [ "$java_version" != 18 ] && echo "You need Java 8" && return || echo "Java version is ok: $JAVA_VER"

  nn_hostname=$1
  mule_path=$2

  p_msg "Downloading the certificate from the server $1 ..."
  echo -n | openssl s_client -connect ${nn_hostname} >$2/host.crt
  echo

  p_msg "Certificate saved at $2/host.crt"
  echo

  p_msg "Creating JSE keystore at $2/noname.jks ..."
  keytool -genkeypair -alias nn-temp -storepass noname -keypass noname -keystore $2/noname.jks -dname "CN=Developer, OU=Department, O=Company, L=City, ST=State, C=CA"

  p_msg "Removing nn-temp alias from $2/noname.jks"
  keytool -delete -alias nn-temp -storepass noname -keystore $2/noname.jks

  p_msg "Importing the certificate $2/host.crt into the keystore $2/noname.jks"
  printf "noname\nyes" | keytool -import -keystore $2/noname.jks -file "$2/host.crt" -alias nn-self-signed-cert

  echo
  p_msg "Deleting the $2/host.crt file"
  rm -fv $2/host.crt

  echo
  p_msg "The keystore noname.jks was successfuly created at: $2/noname.jks"
  echo

  read "response?Do you want to push it to Exchange? [Y/n] "
  response=${response:l}
  if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
    p_msg "Running the mvn command via docker"
    echo
    docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.8.1-adoptopenjdk-15 /bin/bash -c "mvn clean deploy -B -s settings.xml"
  fi

  echo
  p_msg "Noname Anypoint custom policy successfully deployed to Exchange"

}
