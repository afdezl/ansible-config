## ansible-config

Configures the laptop (Ubuntu 26.04) and migrates home-directory config from an old machine.

### Layout

```text
ansible.cfg                       inventory path, roles path, defaults
inventory/hosts.yml               localhost and newlaptop
inventory/group_vars/laptops/     all package lists, repos, dconf settings, git identities
site.yml                          full laptop configuration
migrate.yml                       push credentials and app config from this machine to newlaptop
roles/base                        bootstrap apt packages, ~/Code, ~/Work
roles/apt_repos                   third-party apt repos as deb822 sources
roles/packages                    apt packages, standalone .debs, snaps
roles/docker                      docker-ce, docker and kvm groups
roles/clamav                      clamav and nightly scan cron
roles/user_tools                  uv, opencode, zed, pipx, npm globals, VS Code extensions
roles/dotfiles                    dotfiles repo, symlinks, gitconfig, neovim plugins, terminal profile
roles/gnome                       dconf settings
```

Everything to add or remove lives in `inventory/group_vars/laptops/main.yml`.

### Bootstrap

```shell
./bootstrap.sh
```

### Configure a machine

```shell
ansible-playbook site.yml -K                     # this machine
ansible-playbook site.yml -K -e target=newlaptop # the new machine over SSH
ansible-playbook site.yml -K --tags docker       # a single role
```

### Migrate config to the new machine

Run on the old machine. Requires SSH access to the target host with `~/.ssh/id_rsa`.

```shell
ansible-playbook migrate.yml --check --diff   # preview
ansible-playbook migrate.yml                  # transfer
ansible-playbook migrate.yml -e sync_groups=credentials,opencode
ansible-playbook migrate.yml --tags wifi
```

Groups (`sync_groups`): `credentials`, `opencode`, `vscode`, `small`, `dbeaver`, `clitools`, `vpn`, `history`. Wi-Fi profiles use `--tags wifi`.

The GNOME keyring is not transferred. Log in to Slack, browsers and VS Code sync again on the new machine.

### Notes

- Idempotency was verified in an `ubuntu:26.04` container: a fresh run followed by a second run reports zero changes.
- The `snap`, `vscode` and `gnome` tags need snapd and a desktop session, so they are only exercised on a real machine.
- Gnome terminal focus shortcut (manual): in Settings > Keyboard Shortcuts add a custom shortcut bound to F12:

```text
bash -c "[[ \"$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)\" != \"gnome-terminal\" ]] && wmctrl -a Terminal || xdotool key Alt+grave"
```
