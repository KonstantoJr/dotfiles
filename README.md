# MyDotFiles

If you want to install these config files to a new system follow these steps

1. Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
2. And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```
echo ".cfg" >> .gitignore
```
3. Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
```
git clone --bare https://github.com/KonstantoJr/MyDotFiles $HOME/.cfg
```
4. Define the alias in the current shell scope:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
```
5. Checkout the actual content from the bare repository to your $HOME:
```
config checkout
```
- The step above might fail with a message like:
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. 
The solution is simple: back up the files if you care about them, remove them if you don't care

- Re-run the check out if you had problems:
```
config checkout
```
6. Set the flag showUntrackedFiles to no on this specific (local) repository:
```
config config --local status.showUntrackedFiles no
```
7. You're done, from now on you can now type config commands to add and update your dotfiles:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
