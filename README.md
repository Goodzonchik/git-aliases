# git-aliases

```bash
git config --global alias.cm 'checkout master'         # Переключение на master

git cm # Чекаут в master
```

```bash
git config --global alias.c checkout                  # Общий checkout

git c <branch-name>
```

```bash
git config --global alias.b 'checkout -b'             # Создание ветки
git config --global alias.r 'rebase -i'               # Интерактивный rebase
git config --global alias.rc 'rebase --continue'      # Продолжить rebase
git config --global alias.ra 'rebase --abort'         # Отменить rebase
```
