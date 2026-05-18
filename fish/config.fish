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
# set -gx FLYCTL_INSTALL "$HOME/.fly"
# set -gx PATH "$FLYCTL_INSTALL/bin" $PATH
# alias fly=flyctl

# enhance git diff with bat
alias batdiff='git diff --name-only --relative --diff-filter=d | xargs bat --diff'

# OS specific settings
function source_env
  switch (uname)
    case Linux
		# for gpg signing
		set -gx GPG_TTY $(tty)

		# cargo binaries
		fish_add_path -g "$HOME/.cargo/bin"

		# pnpm
		fish_add_path -g "$HOME/.local/share/pnpm";

		# deno
		fish_add_path -g "$HOME/.deno/bin";

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
	  # pnpm
      fish_add_path -g "/Users/vnphanquang/Library/pnpm"
  end
end

# launch editor, see ~/dev/.config/nvim/README.md
set -gx LAUNCH_EDITOR "$HOME/dev/.config/nvim/launch_editor.sh"

# volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"

source_env

# Starship
set -gx STARSHIP_CONFIG "$HOME/dev/.config/fish/starship.toml"
starship init fish | source

# Copilot CLI
# set -gx PATH "$HOME/.local/bin" $PATH

# opencode
# fish_add_path -g /home/quang/.opencode/bin
