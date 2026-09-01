#!/usr/bin/env bash

# Source this script so the exported variable remains in the current shell:
# source ./1password-integration/load-token.sh

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    echo "ERROR: Source this script instead of executing it."
    echo "source ./1password-integration/load-token.sh"
    exit 1
fi

unset OP_SERVICE_ACCOUNT_TOKEN

read -e -r -s \
    -p "Paste the complete 1Password service-account token: " \
    OP_SERVICE_ACCOUNT_TOKEN
printf '\n'

# Remove common terminal bracketed-paste markers and line endings.
OP_SERVICE_ACCOUNT_TOKEN="${OP_SERVICE_ACCOUNT_TOKEN//$'\e[200~'/}"
OP_SERVICE_ACCOUNT_TOKEN="${OP_SERVICE_ACCOUNT_TOKEN//$'\e[201~'/}"
OP_SERVICE_ACCOUNT_TOKEN="${OP_SERVICE_ACCOUNT_TOKEN//$'\r'/}"
OP_SERVICE_ACCOUNT_TOKEN="${OP_SERVICE_ACCOUNT_TOKEN//$'\n'/}"

if [[ "$OP_SERVICE_ACCOUNT_TOKEN" != ops_* ]]; then
    echo "ERROR: The supplied value is not a service-account token."
    unset OP_SERVICE_ACCOUNT_TOKEN
    return 1
fi

if [[ "$OP_SERVICE_ACCOUNT_TOKEN" =~ [[:space:]] ]]; then
    echo "ERROR: The supplied token contains whitespace."
    unset OP_SERVICE_ACCOUNT_TOKEN
    return 1
fi

export OP_SERVICE_ACCOUNT_TOKEN

echo "Testing 1Password authentication..."
if op vault list --format=json </dev/null >/dev/null 2>&1; then
    echo "1Password authentication successful."
else
    echo "ERROR: 1Password rejected the supplied token."
    unset OP_SERVICE_ACCOUNT_TOKEN
    return 1
fi
