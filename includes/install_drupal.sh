#!/bin/bash
if hash drush 2>/dev/null; then
  echo "Drush is installed"
  PS3='Which version: '
  CMS_VERSION=("7.x" "8.x" "Other")
  select opt in "${CMS_VERSION[@]}"
  do
    if [ "$opt" = "Other" ]; then
      read SPECIFIC_VERSION
      break
    else
      SPECIFIC_VERSION=$opt
      break
    fi
  done
  . $DIR'/primary_domain.sh'
  echo $PRIMARY_DOMAIN
  echo "Installing Drupal" $SPECIFIC_VERSION "to /var/www/webroot/"$PRIMARY_DOMAIN
else
  echo "Drush must be installed on the server"
fi
exit