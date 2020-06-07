# .config
All about config

```bash
cd .tmux && git remote add upstream https://github.com/gpakosz/.tmux.git
cd .bash-it && git remote add upstream https://github.com/Bash-it/bash-it.git
```


## `bash-it`

Completions
```bash
bash-it enable alias clipboard
```

```bash
bash-it enable completion docker export git npm nvm ssh system tmux
```

Plugins
```bash
bash-it enable plugin tmux autojump 
```

## `tmux`

### Install

```bash
cd ~/
export TMUX_PATH=~/dev/.config/.tmux/
ln -s -f "$TMUX_PATH"
ln -s -f "$TMUX_PATH.tmux.conf"
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

## [Vimium][vimium]

Copy these settings into `options` tab in vimium extension menu:
- [Key Mapping][vimium-keymapping]
- [CSS][vimium-style]



[vimium]: https://github.com/philc/vimium
[vimium-keymapping]: ./.vimium/keymapping.conf
[vimium-style]: ./.vimium/style.css
