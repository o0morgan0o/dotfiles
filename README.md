# Personal dotfiles folder

## Installation

- [x] First get the ansible repository `git clone git@github.com:o0morgan0o/ansible.git`

- [x] Create a ssh-agent `eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa`

- [x] Launch the playbook `ansible-playbook setup.yml --ask-become-pass -e machine=desktop`
      This repository will be cloned in `dotfiles` folder in your home directory.
