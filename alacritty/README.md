# [Alacritty]

## Dependencies

| Dependency                                | Description                         |
| ----------------------------------------- | ----------------------------------- |
| [Fira Code Nerd Font][nerdfonts.firacode] | consistent font display in terminal |

## Base Config

For UNIX:

```bash
mkdir -p $HOME/.config/alacritty
ln -sf ~/dev/.config/alacritty/alacritty.unix.toml $HOME/.config/alacritty/alacritty.toml
ln -sf ~/dev/.config/alacritty/includes $HOME/.config/alacritty/includes
```

For Windows:

```powershell
mkdir $env:APPDATA\alacritty
New-Item -Path $env:APPDATA\alacritty\alacritty -ItemType SymbolicLink -Value $HOME\dev\.config\alacritty\alacritty.windows.toml
New-Item -Path $env:APPDATA\alacritty\includes -ItemType SymbolicLink -Value $HOME\dev\.config\alacritty\includes
```

[alacritty]: https://github.com/alacritty/alacritty
[nerdfonts.firacode]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
