# Ansible Automation Controller

Sanitized documentation for a RHEL 8.10 Ansible control host integrated with 1Password for runtime credential retrieval.

## Validated software

| Component | Version |
|---|---:|
| RHEL | 8.10 |
| Ansible Core | 2.16.3 |
| Controller Python | 3.12.14 |
| 1Password CLI | 2.39.0 |
| community.general | 11.4.0 |

## Repository layout

- `ansible-host/`: sanitized controller, inventory, and host-variable examples.
- `1password-integration/`: RHEL installation, service-account, lookup, and security guidance.

## Security

This public repository contains examples only. It intentionally excludes real hostnames, domains, IP addresses, vault names, item IDs, usernames, passwords, service-account tokens, private keys, encrypted credential files, and organization identifiers.
