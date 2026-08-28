# Security guidelines

## Never commit

- `OP_SERVICE_ACCOUNT_TOKEN` or any value beginning with `ops_`
- Passwords, Secret Keys, SSH private keys, or decrypted vault contents
- Ansible Vault credential files, even when encrypted
- Real 1Password vault names or item IDs in a public repository
- Real hostnames, internal domains, IP addresses, usernames, or organization URLs
- 1Password CLI configuration directories

## Operational controls

- Grant each service account read-only, least-privilege vault access.
- Use a separate service account per automation boundary.
- Rotate and revoke tokens according to organizational policy.
- Prefer SSH keys and dedicated automation accounts over reusable host passwords.
- Keep SSH host-key verification enabled.
- Use `no_log: true` on tasks that handle secrets.
- Avoid verbose Ansible logging during authentication troubleshooting.
- Review fact caching before storing values retrieved from secret managers.
- Restrict controller access and run automation as a dedicated non-root account.

## Public-repository check

Before committing:

```bash
grep -RniE '(ops_|password[[:space:]]*[:=]|token[[:space:]]*[:=]|private.?key|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[01])\.)' .
```

Review every match. Field names in sanitized examples are expected; actual values are not.
