# Dotfiles & Config Goodies
All about config

## Table of Contents

- [Dotfiles & Config Goodies](#dotfiles--config-goodies)
  - [Table of Contents](#table-of-contents)
  - [Fonts](#fonts)
  - [[alacritty]](#alacritty)
  - [[fish]](#fish)
  - [[vimium]](#vimium)
  - [[vim]](#vim)
  - [[i3]](#i3)
  - [[polybar]](#polybar)
  - [Miscellaneous Toolings](#miscellaneous-toolings)
  - [[tmux]](#tmux)
    - [Install](#install)
    - [Plugins](#plugins)
    - [Save Session to Bash File](#save-session-to-bash-file)
  - [Karabiner-Elements (MacOS)](#karabiner-elements-macos)
  - [VS Code Extensions](#vs-code-extensions)

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
echo `which fish` | sudo tee -a /etc/shells
chsh -s `which fish`

# install or add to fish_plugins file
jorgebucaran/fisher
IlanCosman/tide@v5
edc/bass
jethrokuan/z
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

## [Karabiner-Elements][karabinder] (MacOS)

Keyboard Binding Software for MacOS

```bash
ln -sf $HOME/dev/.config/.karabiner/karabiner.json $HOME/.config/karabiner/
ln -sf $HOME/dev/.config/.karabiner/assets/complex_modifications/1583596416.json $HOME/.config/karabiner/assets/complex_modifications/
```

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
