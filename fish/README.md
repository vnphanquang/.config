# [Fish] Shell

## Dependencies

| Dependency | Description |
| --- | --- |
| [Fisher][fisher] | fish plugin manager |
| [Starship][starship] | prompt manager |
| [bat] | `cat` alternative (used for git-diff) |
| [direnv] | directory-based environment variables |

```bash
pacman -S fish fisher starship bat fzf direnv
```

> [!IMPORTANT]
> Each plugin in `fish_plugins` might require additional dependencies. Check their respective repositories for more information.

## Base Config

```bash
export FISH_PATH="$HOME/dev/.config/fish"

rm -r $HOME/.config/fish
mkdir -p $HOME/.config/fish

ln -sf $FISH_PATH/config.fish $HOME/.config/fish/config.fish
ln -sf $FISH_PATH/fish_plugins $HOME/.config/fish/fish_plugins
mkdir -p $HOME/.config/fish/functions
ln -sf $FISH_PATH/functions/* $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/conf.d
ln -sf $FISH_PATH/conf.d/* $HOME/.config/fish/conf.d
```

## Setting Fish as Default Shell

```bash
fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

[fish]: https://github.com/fish-shell/fish-shell
[fisher]: https://github.com/jorgebucaran/fisher
[starship]: https://starship.rs
[bat]: https://github.com/sharkdp/bat
[direnv]: https://direnv.net/
