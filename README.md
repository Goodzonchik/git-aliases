# Git favorite alias

You can run script `git-config.sh` for set `user.name`, `user.email` and set aliases for base command.

If you only need some commands, you can copy them from the text below and run them manually.

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
