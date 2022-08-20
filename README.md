### Custom Keybinds
Current $mod = WinKey
| Keys | Function |
|---|---|
|$mod + Shift + s| Takes screenshot of a specified area and saves it on clipboard and ~/Pictures/screenshots|
|$mod + h| Open wofi and show past clipboard history|
|$mod + Control + r| Press one to start recording the selected area, Press a second time to stop the recording|
|$mod + Control + b | Randomly select another background|
|$mod + o| Toggle showing/hiding waybar|
### If you want to install these config files to a new system follow these steps

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

### System Installation
The following line contains the packages needed for system installation
```
firefox git tldr man texlive-most kitty zsh zsh-syntax-highlighting zsh-autosuggestions-git brightnessctl gscreenshot slurp grim sway-launcher-desktop clipman wl-clipboard caffeine-ng udiskie pulseaudio-ctl neovim gsfonts nerd-fonts-mononoki noto-fonts-emoji noto-fonts ttf-ms-fonts ttf-vista-fonts pavucontrol htop baobab visual-studio-code-bin gnome-keyring discord stremio bluez bluez-utils mons texlive-lang entr zathura-pdf-poppler wf-recorder ttf-font-awesome ttf-gentium-basic ttf-jetbrains-mono docker docker-compose feh flex gentium-plus-font github-cli mariadb postgresql pulseaudio-ctl python-autopep8-git python-toml rsync sent skypeforlinux-stable-bin speedtest-cli sqlitebrowser steam tikzit acpi mako mtpfs jmtpfs gvfs-mtp gvfs-gphoto2 sway waybar udiskie swaybg swayidle swaylock-effects-git xorg-xwayland ranger pulseaudio-bluetooth bluez-tools playerctl stpv-git lf pipewire xdg-desktop-portal xdg-desktop-portal-wlr
```
Rust Installer
```
curl https://sh.rustup.rs -sSf | sh
```
