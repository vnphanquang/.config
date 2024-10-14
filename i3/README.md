# [i3]

## Dependencies

| Dependency | Description |
| --- | --- |
| [picom] | compositor (for window opacity) |
| [light] | backlight control |
| [feh] | set background image |
| [playerctl] | media control |
| [main] | screenshot tool |
| [polybar] | status bar, see [polybar/README.md](../polybar/README.md) |
| [XMousePasteBlock] | block middle click paste |

See []
See [Xorg related configuration](../x/README.md) for more information.

## Base Configuration

```bash
ln -sdf $HOME/dev/.config/i3 $HOME/.config/i3

# picom no longer used because of performance issues
# ln -sf $HOME/dev/.config/i3/picom.conf $HOME/.config/picom.conf
```

[picom]: https://github.com/yshui/picom
[i3]: https://i3wm.org/
[light]: http://haikarainen.github.io/light/
[feh]: https://wiki.archlinux.org/title/Feh
[playerctl]: https://github.com/altdesktop/playerctl
[main]: https://github.com/naelstrof/maim
[XMousePasteBlock]: https://github.com/milaq/XMousePasteBlock

