# MacOS Specifics

> For when a gun is pointed to my head and I have to use MacOS.

## [Karabiner-Elements][karabinder] (MacOS)

Keyboard Binding Software for MacOS

```bash
ln -sf $HOME/dev/.config/osx/.karabiner/karabiner.json $HOME/.config/karabiner/
ln -sf $HOME/dev/.config/osx/.karabiner/assets/complex_modifications/* $HOME/.config/karabiner/assets/complex_modifications/
```

## [aerospace]

i3-alternative window tile manager for MacOS.

- Use [BetterDisplay] to better control displays, especially when using multiple monitors.

```bash
ln -sf $HOME/dev/.config/osx/.aerospace/.aerospace.toml $HOME/.aerospace.toml
```

[betterdisplay]: https://github.com/waydabber/BetterDisplay
[karabinder]: https://karabiner-elements.pqrs.org/
[aerospace]: https://github.com/nikitabobko/AeroSpace

