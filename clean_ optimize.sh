#!/bin/sh

first="Removing pacman cache"
second="Refreshing pacman keys"
third="Updating all packages"
fourth="Removing unused packages"
fifth="Optimizing pacman database"
sixth="Running bleachbit"

echo -e "This tool will set up weekly system update/optimizing/cleaning"

# Depencies are cron, bleachbit and xargs

# Since we don't want unexpected behaviors while using the system
# We need to ignore some options on the weekly clean
# This will be done piping to 'grep -v 'option to ignore''

echo -n "30 15 * * sun " > 'cron.txt' # Run every sunday at 15:00h.
echo -n "echo $first && " >> 'cron.txt'
echo -n 'sudo rm -f $(ls /var/cache/pacman/pkg/ | grep -v linux) && echo "Done!" && ' >> 'cron.txt' # Remove pacman cache, keep kernel pkg
echo -n "echo $second && " >> 'cron.txt'
echo -n "sudo pacman-key --refresh-keys >/dev/null 2>/dev/null && echo 'Done!' && " >> 'cron.txt' # Update pacman keys
echo -n "echo $third && " >> 'cron.txt'
echo -n "pacman -Syyu >/dev/null 2>/dev/null && echo 'Done!' && " >> 'cron.txt' # Update all packages
echo -n "echo $fourth && " >> 'cron.txt'
echo -n 'pacman -Rns $(pacman -Qtdq) >/dev/null 2>/dev/null || echo "Already removed" && ' >> 'cron.txt' # Remove all unused packages
echo -n "echo 'Done!' && " >> 'cron.txt'
echo -n "echo $fifth && " >> 'cron.txt'
echo -n "sudo pacman-optimize >/dev/null 2>/dev/null && sync && echo 'Done!' && " >> 'cron.txt' # Optimize pacman database
echo -n "echo $sixth && " >> 'cron.txt'
echo -n "bleachbit --list | " >> 'cron.txt' # List all possible cleaning options
echo -n 'grep -E "[a-z]+\.[a-z]+" | ' >> 'cron.txt' # Remove garbage from the string
echo -n "grep -v .passwords | " >> 'cron.txt' # Do not clean passwords
echo -n "grep -v .memory | " >> 'cron.txt' # Do not clean swap/mem
echo -n "grep -v .clipboard | " >> 'cron.txt' # Do not clean clipboard
echo -n "grep -v .free_disk_space | " >> 'cron.txt' # Do not free empty disk space
echo "xargs bleachbit --clean >/dev/null 2>/dev/null && echo 'Done!'" >> 'cron.txt' # Pass all the arguments to bleachbit



# Create the weekly schedule job
echo "Creating cron job"
crontab cron.txt
rm 'cron.txt'
echo "Done!"
