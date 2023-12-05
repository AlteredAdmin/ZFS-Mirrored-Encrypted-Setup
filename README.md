# ZFS Mirrored Encrypted Setup

## :warning: Experimental Script - Use With Caution
**Disclaimer:** This script is experimental and performs significant disk operations that can potentially erase data. Please use it with extreme caution. Ensure that you have backups of all important data before proceeding. The author is not responsible for any data loss or damage that may occur.

## About
`ZFS_Mirrored_Encrypted_Setup.sh` is a Bash script designed to streamline the process of setting up a mirrored ZFS pool with an encrypted dataset. It's aimed at users who are familiar with ZFS, disk operations, and Linux system administration.

## Features
- Prompts for disk selection to create a mirrored ZFS pool.
- Guides through setting up ZFS encryption with a passphrase.
- Automatically mounts the encrypted dataset to a specified directory.

## Script Explanation
- Shebang and Error Handling: Starts with a shebang for Bash and uses set -e to halt on any error.
- Warning and Confirmation Prompts: Displays warnings about the potential risks of disk operations and requires user confirmation to proceed.
- Disk Selection: Prompts the user to input names for two disks to be used in the ZFS pool.
- Passphrase Setup: Requests a passphrase for ZFS encryption and confirms it, ensuring the user enters the same passphrase twice.
- ZFS Pool Creation: Creates a mirrored ZFS pool using the specified disks.
- Encrypted Dataset Creation: Sets up an encrypted ZFS dataset within the mirrored pool.
- Dataset Mounting: Mounts the encrypted dataset to /mnt/my_raid.
- Completion Notification: Informs the user upon successful completion of the setup.

## Prerequisites
- A Linux system with ZFS installed.
- Knowledge of disk partitioning and ZFS pool management.

## Usage
1. Download the script.
2. Make the script executable: `chmod +x ZFS_Mirrored_Encrypted_Setup.sh`.
3. Run the script: `./ZFS_Mirrored_Encrypted_Setup.sh`.
4. Follow the on-screen prompts carefully.

## Support the Developer
If you found this helpful, please consider:
- **Buymeacoffee:** [Link](http://buymeacoffee.com/alteredadmin)
