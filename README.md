# Ansible Automation Controller

Sanitized examples from an Ansible automation controller that retrieves credentials from 1Password at runtime.

## Repository layout

- `ansible-host/`: controller, inventory, and host-variable examples.
- `1password-integration/`: service-account setup, security guidance, lookup example, and interactive token loader.
- `playbooks/`: reusable Linux administration, reporting, package-management, and security-agent playbooks.

## Playbook safety

Review the inventory limit and run `--syntax-check` before use. Where supported, run with `--check` against a non-production host first. Vendor packages and customer configuration files are deliberately excluded.

## Security

This public repository contains examples only. It excludes real hostnames, domains, IP addresses, vault names, item IDs, usernames, passwords, service-account tokens, private keys, encrypted credential files, customer configuration files, packages, and organization identifiers.
