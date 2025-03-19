# Git Configuration Script

This script automates the setup of global Git settings, such as the username and email, and also adds or updates custom aliases for Git commands.

You can set or update username, email and aliases for git command.

## Using

1. Download script
2. Make the script executable
   
```bash
   chmod +x git_config.sh
```

3. Run script
   
```bash
   ./git_config.sh
```

## Aliases list

`If you only need some commands, you can copy them from the text below and run them manually.`

### checkout to master
```bash
git config --global alias.cm 'checkout master'
```
use: `git cm`

### checkout
```bash
git config --global alias.c checkout
```

use: `git c <branch-name>`

### create new branch and checkout
```bash
git config --global alias.cn 'checkout -b'
```
use: `git cn <branch-name>`

### interactive rebase from master
```bash
git config --global alias.rim 'rebase -i master'
```
use: `git rim`

### rebase continue
```bash
git config --global alias.rc 'rebase --continue'
```
use: `git rc`

### git abort
```bash
git config --global alias.ra 'rebase --abort'
```
use: `git ra`
