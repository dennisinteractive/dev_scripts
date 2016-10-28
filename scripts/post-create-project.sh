#!/bin/sh
pwd=`pwd`

# Remove existing symlink
echo "[Info] Creating symlink. You might need to type your password to use sudo"
if [ -L /usr/local/bin/drupal ]; then sudo rm /usr/local/bin/drupal; fi
# Create symlink
sudo ln -s ${pwd}/vendor/bin/drupal /usr/local/bin/drupal

# Drupal commands
echo "[Info] Drupal init"
drupal init

# Append custom config.yml to the global config
cat ${pwd}/vendor/dennisdigital/drupal_console_commands/config.yml >> ~/.console/config.yml
