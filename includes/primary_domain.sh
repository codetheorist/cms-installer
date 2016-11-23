#!/bin/bash
  echo ''
  echo 'Please enter the primary domain name.'
  echo 'This will be the location of the site in the web root.'
  echo ''
  read PRIMARY_DOMAIN
  . $DIR'/make_directory.sh'