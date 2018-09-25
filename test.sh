#!/bin/bash
export SSH_AUTH_SOCK=0
VERSION=$(ansible --version | head -n1 | awk '{print $2}')
ansible-playbook -vvvv -i inventory site.yml
RC=$?
exit $RC
