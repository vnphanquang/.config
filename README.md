# .config
All about config

## `bash-it`

Completions
```bash
bash-it enable completion docker export git npm nvm ssh system tmux
```

Plugins
```bash
bash-it enable plugin tmux autojump 
```

## `tmux`

# Install

```bash
cd ~/
export TMUX_PATH=~/dev/.config/.tmux/
ln -s -f "$TMUX_PATH.tmux.conf"
ln -s -f "$TMUX_PATH.tmux.conf.local"
```