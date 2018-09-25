#!/bin/bash

rm -rf ~/.ansible/content
rm -rf collections
mkdir collections
CWD=$(pwd)

########################################
#   CREATE A COLLECTION
########################################

cd $CWD/collections
molecule init collection --collection-namespace=foo --collection-name=bar

########################################
#   CREATE A ROLE
########################################

cd $CWD/collections/bar/roles
molecule init role --role-name=role1

########################################
#   CREATE A MODULE
########################################

cd $CWD/collections/bar
molecule init module \
    --name=foobar \
    --change-command="useradd foobar" \
    --check-command="id foobar" \
    --info-command="id foobar"

########################################
#   INSTALL EDITABLE COLLECTION
########################################

cd $CWD/collections
mazer install -e --namespace=foo bar
