## ansible-config

Contains Ansible scripts to configure different machines

### Prerequisites
Python 3.6+ must be present in the system.
Bootstrap the requirements with:

```shell
./bootstrap.sh
```

The repo contains both an `ansible.cfg` and `hosts` file that can be used instead of the default files in `/etc/ansible/`.

These can be replaced by symlinking them.

### Running the roles

#### Laptop

```shell
ansible-playbook -K laptop.yml -v
```

#### Other systems
Can be configured in the `hosts` file present at root level and run as:

```shell
ansible-playbook raspberry.yml -v
```

### Additional configuration
#### Gnome terminal focus shortcut
After configuring the laptop, set `tmux` as the shell. The in `Settings > Keyboard Shortcuts > Add custom shortcut` add the following script:

```text
bash -c "[[ \"$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)\" != \"gnome-terminal\" ]] && wmctrl -a Terminal || xdotool key Alt+grave"
```

Save as `Focus Terminal` and bind to F12.
