# 1Password integration for Ansible

This configuration lets Ansible retrieve managed-host credentials from 1Password at runtime. No host password is stored in inventory, playbooks, Git, or a plaintext variables file.

## Design

1. A dedicated 1Password vault contains approved managed-host login items.
2. A service account has read-only access only to required vaults.
3. `OP_SERVICE_ACCOUNT_TOKEN` authenticates the 1Password CLI.
4. `community.general.onepassword` performs controller-side lookups.
5. Ansible uses the returned username and password only for the current process.

## Requirements

- 1Password CLI 2.18 or newer
- Ansible Core 2.16
- `community.general` 11.4.0
- An approved 1Password service account
- Verified SSH host keys

## Per-host credentials

Use [group-vars-per-host-example.yml](group-vars-per-host-example.yml) when inventory hosts have separate 1Password Login items.

Copy the example to `inventory/group_vars/<group_name>.yml`, replace the placeholder vault and item IDs locally, and keep that real file outside a public repository. The example uses `sysadmin` for SSH and reuses the retrieved password for sudo. If sudo uses a separate password, retrieve a concealed `sudo_password` field instead.

Load the service-account token before running Ansible:

```bash
source /etc/ansible/1password/load-token.sh
```

Validate SSH and privilege escalation before running deployment playbooks:

```bash
ansible <group_name> -i inventory/inventory.ini --forks 1 -m ansible.builtin.ping

ansible <group_name> -i inventory/inventory.ini --forks 1 --become \
  -m ansible.builtin.command -a 'id -u'
```

See the companion documents for installation and security guidance.
