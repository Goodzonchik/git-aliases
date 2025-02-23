# git-aliases

### checkout to master
```bash
# set alias
git config --global alias.cm 'checkout master'

# use
git cm
```

### checkout
```bash
# set alias
git config --global alias.c checkout

# use
git c <branch-name>
```

### create new branch and checkou
```bash
# set alias
git config --global alias.cn 'checkout -b'

# use
git cn <branch-name>
```

### interactive rebase from master
```bash
git config --global alias.rim 'rebase -i master'
```
use: `git rim`

```bash
git config --global alias.rc 'rebase --continue'      # Продолжить rebase
git config --global alias.ra 'rebase --abort'         # Отменить rebase
```
