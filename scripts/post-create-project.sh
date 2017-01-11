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

# Move console-extend to the conventional location.
rm -rf ~/.console/extend;
mv vendor/drupal/console-extend ~/.console/extend
cd ~/.console/extend

# Require our console commands
composer require dennisdigital/drupal_console_commands:dev-drupal_extend --update-no-dev
