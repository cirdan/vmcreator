#!/bin/bash

vagrant up

ansible-galaxy install -r local/roles.txt -p ./local/roles

ansible-playbook ansible/localdomain.yml --ask-sudo-pass
ansible-playbook -i local/ansible-hosts ansible/project.yml