#!/bin/bash
set -e

# Display a warning about disk operations
echo "WARNING: This script will perform disk operations that can erase data."
echo "Please be cautious when selecting disks and ensure you have backups of your data."
echo "Press ENTER to continue or Ctrl+C to abort."
read

# Explanation of what the script does
echo "This script performs the following operations:"
echo "1. Prompts you to specify two disks."
echo "2. Creates a mirrored ZFS pool using the specified disks."
echo "3. Prompts you to specify a passphrase for ZFS encryption."
echo "4. Creates an encrypted ZFS dataset within the mirrored pool."
echo "5. Mounts the encrypted ZFS dataset to /mnt/my_raid."
echo ""
echo "Please make sure you understand each step before proceeding."
echo "Press ENTER to continue or Ctrl+C to abort."
read

# Prompt for disk names
read -p "Enter first disk (e.g., /dev/sdb): " disk1
read -p "Enter second disk (e.g., /dev/sdc): " disk2

# Prompt for ZFS encryption passphrase
read -sp "Enter ZFS encryption passphrase: " passphrase
echo ""

# Confirm ZFS encryption passphrase
read -sp "Confirm ZFS encryption passphrase: " passphrase_confirm
echo ""

# Validate ZFS encryption passphrase
if [ "$passphrase" != "$passphrase_confirm" ]; then
    echo "Passphrases do not match."
    exit 1
fi

# Create a mirrored ZFS pool
echo "Creating a mirrored ZFS pool..."
sudo zpool create mypool mirror $disk1 $disk2

# Create an encrypted ZFS dataset
echo "Creating an encrypted ZFS dataset..."
sudo zfs create -o encryption=on -o keylocation=prompt -o keyformat=passphrase mypool/encrypted

# Set mountpoint
sudo zfs set mountpoint=/mnt/my_raid mypool/encrypted

echo "Done. The encrypted, mirrored ZFS dataset is mounted at /mnt/my_raid."
