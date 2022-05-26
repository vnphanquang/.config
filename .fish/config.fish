if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Tide config
set -U tide_git_bg_color 1e4659
set -U tide_node_bg_color 2a5e53
set -U tide_node_color 32CD32

set -U tide_left_prompt_items os\x1epwd\x1egit\x1enewline\x1echaracter
set -U tide_right_prompt_items status\x1ecmd_duration\x1econtext\x1ejobs\x1enode\x1evirtual_env\x1erustc\x1ekubectl\x1etime

# set -U tide_right_prompt_suffix ''
# set -U tide_prompt_char_bg_color ''
# set -U tide_left_prompt_prefix ''

# Keybinding
set -U EDITOR vim
set fish_key_bindings fish_user_key_bindings

# direnv hook
direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow

# fish-fzf: include hidden files but now .gitignore
set fzf_fd_opts --hidden --exclude=.git

# OS specific settings
function source_env
  switch (uname)
    case Linux
      set -gx PATH "$HOME/.cargo/bin" $PATH;
    case Darwin
      set -gx PATH "$HOME/.cargo/bin" (go env GOPATH)/bin $PATH;
      set -gx PNPM_HOME "/Users/vnphanquang/Library/pnpm"
      set -gx PATH "$PNPM_HOME" $PATH
  end
end
source_env
