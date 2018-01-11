## ansible-config

This repo contains ansible scripts to configure an ubuntu laptop


### Prerequisites

Python{2.7+,3+} and `make` must be installed in the system.

Ansible can be installed as follows:

```bash
$ make install 
```

The repo contains both an `ansible.cfg` and `hosts` file that can be used instead of the default files in `/etc/ansible/`.

These can be replaced by symlinking them.

### Local configuration

The system can be configured by executing `make laptop` from the root of this directory. The user executing the scripts must have sudo permissions.
