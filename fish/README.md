# [Fish] Shell

## Dependencies

| Dependency | Description |
| --- | --- |
| [Fisher][fisher] | fish plugin manager |
| [Tide][tide] | prompt manager |
| [bat] | `cat` alternative (used for git-diff) |

Install manually each of the following (recommended) or add them directly to `~/.config/fish/fish_plugins` file.

> [!IMPORTANT]
> Each plugin might require additional dependencies. Check their respective repositories for more information.

- [jorgebucaran/fisher][fisher]
- [IlanCosman/tide][tide]
- [jorgebucaran/autopair.fish](https://github.com/jorgebucaran/autopair.fish)
- [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [danhper/fish-ssh-agent](https://github.com/danhper/fish-ssh-agent)
- [franciscolourenco/done](https://github.com/franciscolourenco/done)
- [edc/bass](https://github.com/edc/bass)

## Base Config

```bash
export FISH_PATH="$HOME/dev/.config/fish"

rm $HOME/.config/fish/config.fish

ln -sf $FISH_PATH/config.fish $HOME/.config/fish/config.fish
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
[tide]: https://github.com/IlanCosman/tide
[bat]: https://github.com/sharkdp/bat

