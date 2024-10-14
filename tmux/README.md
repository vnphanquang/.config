# [tmux]

## Dependencies

```bash
sudo apt install xclip
```

## Base Configuration

```bash
export TMUX_PATH="$HOME/dev/.config/tmux"
ln -sdf "$TMUX_PATH" $HOME/.tmux
ln -sf "$TMUX_PATH/.tmux.conf" $HOME/.tmux.conf
```

For `tmux-yank` to work:

## Install Plugins (with [tpm])

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

```

## Save Session to Bash File

```bash
chmod +x $HOME/dev/.config/tmux/tmux-save-sessions.sh
```

Based on [tmux-save-sessions], the `tmux-ss` fish alias is available (see [fish/functions/tmux.ss.fish](../fish/functions/tmux-ss.fish)):

[tmux]: https://github.com/tmux/tmux
[tmux-save-sessions]: https://github.com/zsoltf/tmux-save-sessions
[tpm]: https://github.com/tmux-plugins/tpm

