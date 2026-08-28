# Install on RHEL 8

## Add the official 1Password RPM repository

```bash
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc

sudo tee /etc/yum.repos.d/1password.repo >/dev/null <<'EOF'
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc
EOF

sudo dnf install -y 1password-cli
op --version
```

## Install the Ansible collection

```bash
ansible-galaxy collection install 'community.general:==11.4.0'
ansible-galaxy collection list | grep community.general
ansible-doc -t lookup community.general.onepassword
```

Use packages and versions approved by your organization.
