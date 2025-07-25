if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Keybinding
set -U EDITOR nvim
set fish_key_bindings fish_user_key_bindings

# direnv hook
direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow

# fish-fzf: include hidden files but now .gitignore
set fzf_fd_opts --hidden --exclude=.git

alias python=python3

# setup zoxide (z & zi commands)
if type -q zoxide
  zoxide init fish | source
end


# fly.io
set -gx FLYCTL_INSTALL "$HOME/.fly"
set -gx PATH "$FLYCTL_INSTALL/bin" $PATH
alias fly=flyctl

# enhance git diff with bat
alias batdiff='git diff --name-only --relative --diff-filter=d | xargs bat --diff'

# OS specific settings
function source_env
  switch (uname)
    case Linux
      # for gpg signing
      set -gx GPG_TTY $(tty)

      set -gx PATH "$HOME/.cargo/bin" $PATH;

      # pnpm
      set -gx PNPM_HOME "$HOME/.local/share/pnpm";
      if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
      end
			# pnpm end

			# deno
			set -gx DENO_INSTALL "$HOME/.deno"
			if not string match -q -- $DENO_INSTALL $PATH
				set -gx PATH "$DENO_INSTALL/bin" $PATH
			end

			# nvidia driver settings
			# set -gx LIBVA_DRIVER_NAME nvidia
			# set -gx VDPAU_DRIVER nvidia

      # start i3 automatically after login (tested in Arch Linux)
      if type -q i3
      and test -z $DISPLAY
      and test $(tty) = '/dev/tty1'
        startx
      end
    case Darwin
      # set -gx PATH "$HOME/.cargo/bin" (go env GOPATH)/bin $PATH;
      set -gx PNPM_HOME "/Users/vnphanquang/Library/pnpm";
      set -gx PATH "$PNPM_HOME" $PATH;
  end
end

# launch editor, see ~/dev/.config/nvim/README.md
set -gx LAUNCH_EDITOR "$HOME/dev/.config/nvim/launch_editor.sh"

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source_env

# Starship
set -gx STARSHIP_CONFIG "$HOME/dev/.config/fish/starship.toml"
starship init fish | source

