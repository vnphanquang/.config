# .config
All about config

```bash
git clone --recurse-submodules git@github.com:vnphanquang/.config.git
# or https://github.com/vnphanquang/.config.git
cd .tmux && git remote add upstream https://github.com/gpakosz/.tmux.git
cd .bash-it && git remote add upstream https://github.com/Bash-it/bash-it.git
cd .vimium && git remote add upstream https://github.com/philc/vimium
```

## [Powerline Font][powerline-fonts]
```bash
sudo apt-get install fonts-powerline
```

## [bash-it][]

### Installation
```bash
# fetch alacritty completion
wget https://raw.githubusercontent.com/alacritty/alacritty/4cb5566a9c2d68006ffa97e2f8082ae3ef6c8de4/extra/completions/alacritty.bash -O completion/available/alacritty.bash

# cd to bash-it repo
./install.sh
# edit in .bashrc or .bash_profile
export BASH_IT_THEME='farius'
# enable alias
bash-it enable alias clipboard
# enable completions
bash-it enable completion docker export git npm nvm ssh system tmux alacritty
# enable plugins
bash-it enable plugin tmux autojump
```

### [autojump][]
```bash
sudo apt install autojump
```


## [tmux][]

### Install
```bash
# install tmux
sudo apt install bison \
				autotools-dev \
                automake \
				libncurses5-dev \
				libevent-dev \
				pkg-config \
				libutempter-dev \
				build-essential
git clone git@github.com:tmux/tmux.git --branch <version_tag>
cd tmux
sh autogen.sh
./configure && make
sudo make install
# link config
export TMUX_PATH="~/dev/.config/.tmux/"
ln -s -f "$TMUX_PATH" ~/
ln -s -f "$TMUX_PATH.tmux.conf" ~/
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

## [vimium][]

1. Open Chrome extension and load `.vimium` repo to install extension
2. Copy these settings into `options` tab in vimium extension menu:
- [Key Mapping][vimium-keymapping]
- [CSS][vimium-style]

## vim

```bash
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create necessary directories
mkdir ~/.vim
mkdir ~/.vim/undodir

# link vim configs
export VIM_PATH="~/dev/.config/.vim"
ln -sf "$VIM_PATH/.vimrc" ~/
ln -sf "$VIM_PATH/*" ~/.vim
```

[bash-it]: https://github.com/Bash-it/bash-it
[tmux]: https://github.com/tmux/tmux
[autojump]: https://github.com/wting/autojump
[vimium]: https://github.com/philc/vimium
[vimium-keymapping]: ./.vimium/keymapping.conf
[vimium-style]: ./.vimium/style.css
[powerline-fonts]: https://github.com/powerline/fonts
