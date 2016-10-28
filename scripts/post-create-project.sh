#!/bin/sh

# Remove existing symlink
if [ -L /usr/local/bin/drupal ]; then sudo rm /usr/local/bin/drupal; fi
# Create symlink
echo "[Info] Creating symlink"
sudo ln -s ./vendor/bin/drupal /usr/local/bin/drupal

# Drupal commands
echo "[Info] Drupal init"
drupal init

# Append custom config.yml to the global config
cat ./vendor/dennisdigital/drupal_console_commands/config.yml >> ~/.console/config.yml
