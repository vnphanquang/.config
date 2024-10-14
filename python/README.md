# Python Configuration

## Jupyter Console

Install `jupyter-console` and `python-jupyter-console` (assuming Arch Linux):

```bash
paru -S jupyter-console python-jupyter-console jupyterthemes
```

Link configuration

```Bash
ln -sf $HOME/dev/.config/python/.jupyter/jupyter_console_config.py $HOME/.jupyter/jupyter_console_config.py
ln -sf $HOME/dev/.config/python/.jupyter/jupyter_qtconsole_config.py $HOME/.jupyter/jupyter_qtconsole_config.py
```

