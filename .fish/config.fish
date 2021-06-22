# Tide config
set -U tide_git_prompt_bg_color 1e4659
set -U tide_nvm_bg_color  2a5e53
set -U tide_nvm_color  32CD32

set -U tide_left_prompt_items  context\x1epwd\x1egit_prompt\x1enewline\x1eprompt_char
set -U tide_right_prompt_items  status\x1ecmd_duration\x1ejobs\x1envm\x1erust\x1etime

set -U tide_right_prompt_suffix ''
set -U tide_prompt_char_bg_color ''
set -U tide_left_prompt_prefix ''

set -U EDITOR vim

set fish_key_bindings fish_user_key_bindings

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/vnphanquang/dev/dsv/odc/apps/compagnon/uninstaller/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/vnphanquang/dev/dsv/odc/apps/compagnon/uninstaller/node_modules/tabtab/.completions/electron-forge.fish

# direnv hook
direnv hook fish | source

# OS specific settings

switch (uname)
  case Darwin
    set -gx PATH "$HOME/.cargo/bin" (go env GOPATH)/bin $PATH;
end
