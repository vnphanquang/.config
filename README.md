# Dotfiles & Config Goodies
All about config

## Table of Contents

- [Dotfiles \& Config Goodies](#dotfiles--config-goodies)
  - [Table of Contents](#table-of-contents)
  - [Fonts](#fonts)
  - [Linux Natural Scrolling](#linux-natural-scrolling)
  - [alacritty](#alacritty)
  - [fish](#fish)
  - [vimium](#vimium)
  - [vim](#vim)
  - [i3](#i3)
  - [polybar](#polybar)
  - [rofi](#rofi)
  - [Miscellaneous Toolings](#miscellaneous-toolings)
  - [tmux](#tmux)
    - [Install](#install)
    - [Plugins](#plugins)
    - [Save Session to Bash File](#save-session-to-bash-file)
  - [VS Code Extensions](#vs-code-extensions)
  - [Multiple SSH for Different Github Usernames](#multiple-ssh-for-different-github-usernames)
  - [MacOS Specifics](#macos-specifics)
    - [Karabiner-Elements (MacOS)](#karabiner-elements-macos)
    - [yabai \& skhd](#yabai--skhd)
    - [spacebar](#spacebar)
    - [\[dunst\]](#dunst)

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

## [alacritty]

```bash
ln -sf ~/dev/.config/.alacritty/.alacritty.yml $HOME
```

## [fish]

Dependencies:

- Fish Plugin Manager: [Fisher][fisher]
- Prompt Manager: [Tide][tide]

<details open>
  <summary>Configuration</summary>

```bash
# set fish as default
fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# install or add to fish_plugins file
jorgebucaran/fisher
IlanCosman/tide@v5
edc/bass
franciscolourenco/done
danhper/fish-ssh-agent
PatrickF1/fzf.fish
jorgebucaran/autopair.fish


# link fish config (fisher)
export FISH_PATH="$HOME/dev/.config/.fish"
rm $HOME/.config/fish/config.fish
ln -sf $FISH_PATH/config.fish $HOME/.config/fish/config.fish

ln -sf $FISH_PATH/completions/* $HOME/.config/fish/completions
ln -sf $FISH_PATH/functions/* $HOME/.config/fish/functions
ln -sf $FISH_PATH/conf.d/* $HOME/.config/fish/conf.d
```

</details>

## [vimium]

1. Open Chrome extension and load `.vimium` repo to install extension
2. Copy these settings into `options` tab in vimium extension menu:
   1. [Key Mapping][vimium-keymapping]
   2. [CSS][vimium-style]

## [vim]

<details open>
  <summary>Configuration: show / hide</summary>

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

</details>

## [i3]

Dependencies:

- [picom]: support for custom terminal opacity

Configuration:


```bash
ln -sf $HOME/dev/.config/.i3 $HOME/.config/i3
ln -sf $HOME/dev/.config/.i3/picom.conf $HOME/.config/picom

ln -sf $HOME/dev/.config/.polybar $HOME/.config/polybar
```

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

## Miscellaneous Toolings

| Tool | Description |
| --- | --- |
| [bat] | `cat` clone written with `rust`
| [Qalculate!] | desktop calculator |
| [exa] | replacement for ls |
| [maim] | make image (screenshots) |
| [peek] | make gif |

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

## VS Code Extensions

| Extension | Usage
| --- | --- |
| [EditorConfig][vscode.editorconfig] | override workspace format settings with `.editorconfig` file |
| [Eslint][vscode.eslint] | eslint integration |
| [Git Graph][vscode.gitgraph] | Git graph representation |
| [Turbo Console Log][vscode.turboconsolelog] | Quick logging |
| [Todo][vscode.todo] | Todo Tree / List |
| [Stylelint][vscode.stylelint] | Stylelint integration |
| [Live share][vscode.liveshare] | Pair programming session |
| [Markdown All in One][vscode.markdownallinone] | Markdown Table of Contents & Preview |
| [Path Intellisense][vscode.pathintellisense] | Path Intellisense |
| [SVG Preview][vscode.svgpreview] | Preview SVG |
| [Auto Rename Tag][vscode.autorenametag] | Quick renaming html tag |
| [Tailwind][vscode.tailwind] | Tailwind integration |
| [Vim][vscode.vim] | Vim keybinding |

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

### [dunst]

> Shouldn't be using this,

```bash
chmod +x $HOME/dev/.config/.dunst/dunstrc
ln -sf $HOME/dev/.config/.dunst/dunstrc $HOME/.config/dunst/dunstrc
```

[bash-it]: https://github.com/Bash-it/bash-it
[tmux]: https://github.com/tmux/tmux
[tmux.save-sessions]: https://github.com/zsoltf/tmux-save-sessions
[autojump]: https://github.com/wting/autojump
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
[exa]: https://github.com/ogham/exa
[bat]: https://github.com/sharkdp/bat
[alacritty]: https://github.com/alacritty/alacritty

[polybar]: https://polybar.github.io/
[polybar.gmail]: https://github.com/crabvk/polybar-gmail

[rofi]: https://github.com/davatorium/rofi

[maim]: https://github.com/naelstrof/maim

[peek]: https://github.com/phw/peek

[vscode.editorconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[vscode.eslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[vscode.liveshare]: https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare
[vscode.gitgraph]: https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph
[vscode.pathintellisense]: https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense
[vscode.turboconsolelog]: https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log
[vscode.vim]: https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
[vscode.stylelint]: https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
[vscode.tailwind]: https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss
[vscode.todo]: https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
[vscode.svgpreview]: https://marketplace.visualstudio.com/items?itemName=SimonSiefke.svg-preview
[vscode.markdownallinone]: https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
[vscode.autorenametag]: https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag

[yabai]: https://github.com/koekeishiya/yabai
[skhd]: https://github.com/koekeishiya/skhd
[spacebar]: https://github.com/cmacrae/spacebar
