# [tmux]

## Dependencies

```bash
sudo pacman -S xclip
sudo apt install xclip
```

## Base Configuration

```bash
ln -sdf $HOME/dev/.config/tmux $HOME/.config/tmux
```

For `tmux-yank` to work:

## Install Plugins (with [tpm])

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

## Save Session to Bash File

```bash
chmod +x $HOME/.config/tmux/tmux-save-session.sh
```

Based on [tmux-save-sessions], the `tmux-ss` fish alias is available (see [fish/functions/tmux.ss.fish](../fish/functions/tmux-ss.fish)):

[tmux]: https://github.com/tmux/tmux
[tmux-save-sessions]: https://github.com/zsoltf/tmux-save-sessions
[tpm]: https://github.com/tmux-plugins/tpm

