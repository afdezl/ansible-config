## ansible-config

This repo contains ansible scripts to configure an ubuntu laptop


### Prerequisites

Python{2.7+,3+} and Ansible must be installed in the system.

Ansible can be installed as follows:

```bash
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

*[Optionally]* `make` can be installed to simplify the execution.

The repo contains both an `ansible.cfg` and `hosts` file that can be used insted of the default files in `/etc/ansible/`.

These can be replaced by symlinking them.

### Local configuration

The system can be configured by executing `make laptop` from the root of this directory. The user executing the scripts must have sudo permissions.
