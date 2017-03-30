#!/bin/bash

mkdir -p /opt/example/vault

cp binaries/vault.linux.amd64-0.6.4 /opt/example/vault/vault
chmod 755 /opt/example/vault/vault
ln -s /opt/example/vault/vault /usr/bin/vault

cp config_files/profiles_d_vault /etc/profile.d/set_vault_address.sh
chmod +x /etc/profile.d/set_vault_address.sh
chmod 755 /etc/profile.d/set_vault_address.sh
