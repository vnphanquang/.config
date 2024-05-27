# Dotfiles & Config Goodies

All about config

## Fonts

| Font | Installation | Usage |
| --- | --- | --- |
| [Fira Code NerdFont][fonts.firacode.nerd] | follow website instructions | system |
| [Powerline Font][fonts.powerline] | follow website instructions | terminal |
| Iosevka Nerd Font | `.fonts/iosevka_nerd_fonts.ttf` | polybar |

```bash
# link all user fonts
ln -sf $HOME/dev/.config/.fonts $HOME/.fonts
```

## Linux Natural Scrolling

> /usr/share/X11/xorg.conf.d/40-libinput.conf

```conf
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "False"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```

## Blocking Middle Click Paste

https://github.com/milaq/XMousePasteBlock

## Miscellaneous Toolings

```bash
sudo pacman -S xdotool kruler
```

| Tool | Description |
| --- | --- |
| [bat] | `cat` clone written with `rust` |
| [Qalculate!] | desktop calculator |
| [eza] | replacement for ls |
| [maim] | make image (screenshots) |
| [peek] | make gif |
| [zoxide] | smarter `cd` |

## Arch Linux

### AutoLogin with Getty

Credit: https://jackcuthbert.dev/blog/automated-login-in-arch-linux

```conf
# /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin USERNAME_HERE --noclear %I $TERM
```

## [fish]

Dependencies:

- Fish Plugin Manager: [Fisher][fisher]
- Prompt Manager: [Tide][tide]

```bash
# set fish as default
fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# link fish config (fisher)
export FISH_PATH="$HOME/dev/.config/.fish"
rm $HOME/.config/fish/config.fish
ln -sf $FISH_PATH/config.fish $HOME/.config/fish/config.fish

ln -sf $FISH_PATH/completions/* $HOME/.config/fish/completions
ln -sf $FISH_PATH/functions/* $HOME/.config/fish/functions
ln -sf $FISH_PATH/conf.d/* $HOME/.config/fish/conf.d

# install or add to fish_plugins file
jorgebucaran/fisher
IlanCosman/tide
edc/bass
franciscolourenco/done
danhper/fish-ssh-agent
PatrickF1/fzf.fish
jorgebucaran/autopair.fish
```

## [alacritty]

```bash
ln -sf ~/dev/.config/.alacritty/.alacritty.toml $HOME
```

## [vim]

```bash
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create necessary directories
mkdir ~/.vim
mkdir ~/.vim/undodir

# link vim configs
export VIM_PATH="$HOME/dev/.config/.vim"
ln -sf $VIM_PATH/.vimrc $HOME/
ln -sf $VIM_PATH/* $HOME/.vim
```

## [tmux]

### Install

Configuration:

```bash
export TMUX_PATH="$HOME/dev/.config/.tmux/"
ln -s -f "$TMUX_PATH" $HOME/
ln -s -f "$TMUX_PATH.tmux.conf" $HOME/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

For `tmux-yank` to work:

```bash
sudo apt install xclip
```

### Plugins

Plugin Manager: `tpm`

- `tmux-yank`
- `tmux-copycat`
- `tmux-open`
- `tmux-resurrect`
- `tmux-sidebar`
- `tmux-continuum`
- `tmux-jump`

### [Save Session to Bash File][tmux.save-sessions]

## [polybar]

Dependencies:

- [rofi]: window launcher
- [polybar gmail][polybar.gmail]: unread gmail notification (some python packages to install, see repo readme)

Configuration:

```bash
ln -sf $HOME/dev/.config/.polybar $HOME/.config/polybar
```

## [rofi]

```bash
chmod -R +x $HOME/dev/.config/.rofi
ln -sf $HOME/dev/.config/.rofi $HOME/.config/rofi
```

## [dunst]

```bash
chmod +x $HOME/dev/.config/.dunst/dunstrc
ln -sf $HOME/dev/.config/.dunst $HOME/.config/dunst
```

## [i3]

> [!NOTE]
> - requires `playerctl` for media control

Dependencies:

- [picom]: support for custom terminal opacity
- [light](http://haikarainen.github.io/light/): backlight control
- [feh](https://wiki.archlinux.org/title/Feh): set background image

Configuration:

```bash
ln -sf $HOME/dev/.config/.i3 $HOME/.config/i3
# picom no longer used because of performance issues
# ln -sf $HOME/dev/.config/.i3/picom.conf $HOME/.config/picom.conf
```

For high-resolution monitor, change system DPI to scale up appropriately. 96 is 1x, 192 is 2x.

```bash
ln -sf $HOME/dev/.config/.Xresources $HOME/.Xresources
ln -sf $HOME/dev/.config/.xinitrc $HOME/.xinitrc
```

To reload `.Xresources`, run `xrdb ~/.Xresources`

To figure out the key ID for binding, run:

```bash
xev -event keyboard | egrep -o 'keycode.*\)'
```

### Visual Studio Code

```bash
ln -sf $HOME/dev/.config/vscode/argv.json $HOME/.vscode/argv.json
ln -sf $HOME/dev/.config/vscode/extensions/extensions.json $HOME/.vscode/extensions/extensions.json
ln -sf $HOME/dev/.config/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -sf $HOME/dev/.config/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
```

## Multiple SSH for Different Github Usernames

```ini
# File ~/.ssh/config

# for github.com/vnphanquang
Host github.com-vnphanquang
  HostName github.com
  IdentityFile ~/.ssh/vnphanquang_rsa
  IdentitiesOnly yes
```

```ini
# File: <git_root>/.git/config
[remote "origin"]
  url = git@github.com-username:domain
```

## [vimium]

1. Open Chrome extension and load `.vimium` repo to install extension
2. Copy these settings into `options` tab in vimium extension menu:
   1. [Key Mapping][vimium-keymapping]
   2. [CSS][vimium-style]

## MacOS Specifics

### [Karabiner-Elements][karabinder] (MacOS)

Keyboard Binding Software for MacOS

```bash
ln -sf $HOME/dev/.config/.karabiner/karabiner.json $HOME/.config/karabiner/
ln -sf $HOME/dev/.config/.karabiner/assets/complex_modifications/* $HOME/.config/karabiner/assets/complex_modifications/
```

### [yabai] & [skhd]

```bash
mkdir $HOME/.config/yabai
chmod +x $HOME/dev/.config/.yabai/yabairc
ln -sf $HOME/dev/.config/.yabai/yabairc $HOME/.config/yabai/yabairc
```

```bash
mkdir $HOME/.config/skhd
chmod +x $HOME/dev/.config/.skhd/skhdrc
ln -sf $HOME/dev/.config/.skhd/skhdrc $HOME/.config/skhd/skhdrc
ln -sf $HOME/dev/.config/.yabai/yabairc $HOME/.config/yabai/yabairc
```

### [spacebar]

```bash
mkdir $HOME/.config/spacebar
chmod +x $HOME/dev/.config/.spacebar/spacebarrc
ln -sf $HOME/dev/.config/.spacebar/spacebarrc $HOME/.config/spacebar/spacebarrc
```

### [aerospace]

i3-alternative window tile manager for MacOS.

- Use [BetterDisplay] to better control displays, especially when using multiple monitors.

```bash
ln -sf $HOME/dev/.config/.aerospace/.aerospace.toml $HOME/.aerospace.toml
```

[betterdisplay]: https://github.com/waydabber/BetterDisplay
[aerospace]: https://github.com/nikitabobko/AeroSpace
[tmux]: https://github.com/tmux/tmux
[tmux.save-sessions]: https://github.com/zsoltf/tmux-save-sessions
[vimium]: https://github.com/philc/vimium
[vimium-keymapping]: ./.vimium/keymapping.conf
[vimium-style]: ./.vimium/style.css
[fish]: https://github.com/fish-shell/fish-shell
[fisher]: https://github.com/jorgebucaran/fisher
[tide]: https://github.com/IlanCosman/tide
[karabinder]: https://karabiner-elements.pqrs.org/
[i3]: https://i3wm.org/
[picom]: https://github.com/yshui/picom
[vim]: https://www.vim.org/

[fonts.firacode.nerd]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
[fonts.powerline]: https://github.com/powerline/fonts

[Qalculate!]: https://qalculate.github.io/
[eza]: https://github.com/eza-community/eza
[bat]: https://github.com/sharkdp/bat
[alacritty]: https://github.com/alacritty/alacritty

[polybar]: https://polybar.github.io/
[polybar.gmail]: https://github.com/crabvk/polybar-gmail

[rofi]: https://github.com/davatorium/rofi

[maim]: https://github.com/naelstrof/maim

[peek]: https://github.com/phw/peek

[yabai]: https://github.com/koekeishiya/yabai
[skhd]: https://github.com/koekeishiya/skhd
[spacebar]: https://github.com/cmacrae/spacebar
[dunst]: https://github.com/dunst-project/dunst
[zoxide]: https://github.com/ajeetdsouza/zoxide
