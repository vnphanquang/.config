# [wezterm]

## Base Configuration

```bash
ln -sf "$HOME/dev/.config/wezterm/.wezterm.lua" $HOME/.wezterm.lua
```

For undercurl support:

```bash
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
```

[wezterm]: https://wezfurlong.org/wezterm

