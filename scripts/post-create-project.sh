#!/bin/sh
set -x
pwd=`pwd`

# Remove existing symlink
echo "[Info] Creating symlink. You might need to type your password to use sudo"
if [ -L /usr/local/bin/drupal ]; then sudo rm /usr/local/bin/drupal; fi
# Create symlink
sudo ln -s ${pwd}/vendor/bin/drupal /usr/local/bin/drupal

# Drupal commands
echo "[Info] Drupal init"
drupal init --override
drupal settings:set environment dev

# Copy chain commands
cp vendor/dennisdigital/drupal_console_commands/chain/*.yml ~/.console/chain

# Move console-extend to the conventional location.
rm -rf ~/.composer/extend;
mv vendor/drupal/console-extend ~/.console/extend
cd ~/.console/extend
composer install