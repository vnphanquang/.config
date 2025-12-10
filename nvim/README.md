# [neovim]

## Base Config

For UNIX system:

1. Install dependencies:

   ```bash
   # install dependencies
   paru -S luarocks
   sudo apt install -y luarocks
   ```

   Assuming NodeJS is already installed (some dependencies depend on that)

```bash
# core
ln -sdf ~/dev/.config/nvim $HOME/.config/nvim

# if using vim plugin in IDEA-based IDEs
ln -sdf ~/dev/.config/nvim/idea.vim $HOME/.ideavimrc

# treesitter svelte textobjects, run after installing nvim-treesitter and nvim-treesitter-textobjects
ln -sf ~/dev/.config/nvim/treesitter/queries/svelte/textobjects.scm ~/.local/share/nvim/lazy/nvim-treesitter-textobjects/queries/svelte/textobjects.scm
```

For Windows:

```bash
New-Item -Path $env:LOCALAPPDATA\nvim -ItemType SymbolicLink -Value $HOME\dev\.config\nvim
```

[neovim]: https://neovim.io
