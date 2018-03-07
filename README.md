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


#### s3fs specifics

Installation of s3fs requires manual intervention, to achieve a working state, follow the next steps:

```bash
cd /home/$USER/projects/s3fs-fuse
./autogen.sh
./configure
make
sudo make install
```

Next, create the following file `/etc/passwd-s3fs` and add the user/bucket specific `ACCESS_KEY_ID`:`SECRET_ACCESS_KEY_ID`

```bash
sudo chmod 640 /etc/passwd-s3fs
```

Mount the bucket as follows:

```bash
sudo mkdir -p /s3/<local_name>
sudo s3fs -o allow_other <s3_bucket_name> <local_name> 
```

After this, only root will be able to write to it. This can be overridden.
