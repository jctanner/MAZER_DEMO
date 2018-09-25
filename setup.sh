#!/bin/bash

CWD=$(pwd)
WORKSPACE="$CWD/workspace"

#################################################
#   CHECKOUTS
#################################################

if [[ ! -d $WORKSPACE/github/jctanner/molecule ]]; then
    echo "Making molecule [fork] checkout"
    mkdir -p $WORKSPACE/github/jctanner
    git clone git@github.com:jctanner/molecule $WORKSPACE/github/jctanner/molecule
    cd $WORKSPACE/github/jctanner/molecule
    git remote add upstream https://github.com/metacloud/molecule
fi

BRANCH=$(cd $WORKSPACE/github/jctanner/molecule; git branch| egrep ^\\*)
if [[ $BRANCH != "MAZER_COLLECTIONS_ANSIBLE_TEST" ]]; then
    echo "Checking out the molecule feature branch"
    cd $WORKSPACE/github/jctanner/molecule
    git checkout MAZER_COLLECTIONS_ANSIBLE_TEST
fi

if [[ ! -d $WORKSPACE/github/ansible/ansible ]]; then
    echo "Creating ansible checkout"
    mkdir -p $WORKSPACE/github/ansible
    git clone git@github.com:ansible/ansible $WORKSPACE/github/ansible/ansible
fi

BRANCH=$(cd $WORKSPACE/github/ansible/ansible; git branch| egrep ^\\*)
if [[ $BRANCH != "mazer_role_loader" ]]; then
    echo "Checking out the ansible feature branch"
    cd $WORKSPACE/github/ansible/ansible
    git checkout mazer_role_loader
fi

#################################################
#   VENV
#################################################

cd $CWD

if [[ ! -d venv ]]; then
    echo "Creating virtualenv"
    virtualenv venv
fi

source venv/bin/activate


