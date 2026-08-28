# Service-account setup

Create the service account in the organization's 1Password web portal.

## Recommended permissions

- Dedicated automation identity
- Read-only access
- Only approved automation vaults
- No permission to create vaults
- No write or sharing permission
- Documented owner and rotation schedule

The authorization token is shown once. Save it in a separate restricted administrative vault that the service account itself cannot access.

## Interactive validation

```bash
unset OP_SERVICE_ACCOUNT_TOKEN
read -e -r -s -p "Paste the complete ops_ token: " OP_SERVICE_ACCOUNT_TOKEN
echo
export OP_SERVICE_ACCOUNT_TOKEN

op vault list
```

Remove it when testing is complete:

```bash
unset OP_SERVICE_ACCOUNT_TOKEN
```

For unattended production execution, load the token from an organization-approved protected credential mechanism. Never place it in shell profiles, inventory, playbooks, Git, command-line arguments, screenshots, or logs.
