# Sanitized Ansible host configuration

This folder models a RHEL 8.10 Ansible controller using Ansible Core 2.16.3 and Python 3.12.

## Install

```bash
sudo dnf install -y ansible-core
ansible --version
```

## Files

- `ansible.cfg.example`: minimal safe controller settings.
- `inventory.ini.example`: neutral multi-environment inventory.
- `host_vars/linux-server01.yml`: maps one host to a 1Password item.
- `requirements.yml`: pinned collection dependency.

Install dependencies:

```bash
ansible-galaxy collection install -r requirements.yml
```

Validate:

```bash
ansible-inventory -i inventory.ini.example --graph
ansible-playbook -i localhost, ../1password-integration/test-1password.yml
```

Do not disable SSH host-key checking. Verify and populate the controller's `known_hosts` before connecting to managed nodes.
