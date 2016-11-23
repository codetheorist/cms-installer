#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo $DIR
function containsElem {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}
  echo ''
  echo "You've chosen to install a site."
  echo "The sites primary domain name will be $PRIMARY_DOMAIN."
  echo "The sites alternative domain names will be $ALT_DOMAINS."
  echo ''
  PS3='Please choose: '
  CMS=("Drupal" "Wordpress")
  select opt in "${CMS[@]}"
  do
    if containsElem $opt "${CMS[@]}"; then
      PLATFORM=${opt,,}
      PLATFORM='/install_'$PLATFORM'.sh'
      break
    else
      echo "Incorrect choice."
    fi
  done
