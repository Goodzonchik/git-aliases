# git-aliases

## Git checkout

### checkout to master
```bash
# set alias
git config --global alias.cm 'checkout master'

# using
git cm
```

```bash
git config --global alias.c checkout                  # Общий checkout

git c <branch-name>
```

```bash
git config --global alias.b 'checkout -b'             # Создание ветки

```

## Git rebase


```bash
git config --global alias.r 'rebase -i'               # Интерактивный rebase
git config --global alias.rc 'rebase --continue'      # Продолжить rebase
git config --global alias.ra 'rebase --abort'         # Отменить rebase
```
