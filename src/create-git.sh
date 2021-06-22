#!/bin/bash
key=""
source="./src/"
target="."

NC='\033[0m'
RED='\033[0;31m'
GREEN="\033[0;32m"
YELLOW='\033[1;33m'
BLUE='\033[0;34m'

function help() {
  echo
  echo "Create Git - Tool to create binary executable git file using compiled SSH Key"
  echo
  echo -e  "Syntax: ${GREEN}create-git ${YELLOW}[OPTIONS]${NC}"
  echo
  echo "Example usage: "
  echo -e "${BLUE}$ ${NC}create-git -k /path/to/your/company/topsecret/private/key [-s|--source] [i.e. /home/{user}/repositories/create-git/src] [-t|--target] [i.e. /top/secret/path/to/encrypted/company/drive/bin/]"
  echo
  echo "OPTIONS:"
  echo "   -k, --key             Full absolute path to SSH Key file (i.e. /home/{user}/.ssh/id_rsa)"
  echo "   [-h, --help, -?]      Print this help"
  echo "   [-s, --source]        Path to source directory"
  echo "   [-t, --target]        Target source to create git executable file"
  echo
}

no_args="true"
while [[ $# -gt 0 ]]; do
  option="$1"

  case $option in
    -k|--key)
      key="$2"
      shift # past argument
      shift # past value
      ;;
    -s|--source)
      source="$2"
      shift # past argument
      shift # past value
      ;;
    -t|--target)
      target="$2"
      shift # past argument
      shift # past value
      ;;
    -h|--help|-?)
      help
      shift # past argument
      shift # past value
      ;;
    *)
      # shellcheck disable=SC2059
      printf "${RED}Unknown option passed:${NC} ${YELLOW}$1${NC}\n\n"
      help
      exit
      ;;
  esac
  no_args="false"
done;

if [[ "$no_args" == "true" ]]; then
  echo -n 'Enter source to private key SSH: '
  read -r key
fi

cp "$source/git.sh" git.sh.tmp
sed -i -e "s|\$SSH_KEY|$key|g" git.sh.tmp
shc -f git.sh.tmp
mv git.sh.tmp.x "$target/git"
rm git.sh.tmp*
