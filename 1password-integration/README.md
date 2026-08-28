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

See the companion documents for installation and security guidance.
