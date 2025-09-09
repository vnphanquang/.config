# [neovim]

## Base Config

For UNIX system:

```bash
ln -sdf ~/dev/.config/nvim $HOME/.config/nvim
ln -sf ~/dev/.config/nvim/treesitter/queries/svelte/textobjects.scm ~/.local/share/nvim/lazy/nvim-treesitter-textobjects/queries/svelte/textobjects.scm
ln -sdf ~/dev/.config/nvim/idea.vim $HOME/.ideavimrc
```

For Windows:

```bash
New-Item -Path $env:LOCALAPPDATA\nvim -ItemType SymbolicLink -Value $HOME\dev\.config\nvim
```

[neovim]: https://neovim.io
