# Fonts

| Font                                      | Installation                    | Usage    |
| ----------------------------------------- | ------------------------------- | -------- |
| [Fira Code NerdFont][fonts.firacode.nerd] | follow website instructions     | system   |
| [Powerline Font][fonts.powerline]         | follow website instructions     | terminal |
| Noto Sans CJK                             | via pacman                      | system   |
| Iosevka Nerd Font                         | `.fonts/iosevka_nerd_fonts.ttf` | polybar  |

```bash
sudo pacman -S ttf-firacode-nerd powerline powerline-fonts noto-fonts-cjk
```

```bash
mkdir $HOME/.fonts
ln -sdf $HOME/dev/.config/fonts/ $HOME/.fonts/
```

[fonts.firacode.nerd]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
[fonts.powerline]: https://github.com/powerline/fonts
