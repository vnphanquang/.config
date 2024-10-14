# [X](https://www.x.org/wiki/) (Xorg) Configuration

## Base Config

```bash
ln -sf $HOME/dev/.config/x/.Xresources $HOME/.Xresources
ln -sf $HOME/dev/.config/x/.xinitrc $HOME/.xinitrc
```

To reload `.Xresources`, run `xrdb ~/.Xresources`

## Testing Key ID for Binding

```bash
xev -event keyboard | egrep -o 'keycode.*\)'
```

