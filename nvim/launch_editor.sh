#!/bin/bash

###
### Use to support vite-plugin-svelte inspector to open nvim. See:
### https://theosteiner.de/open-neovim-from-your-browser-integrating-nvim-with-sveltes-inspector
###

filename=$1
line=${2:-"1"}
column=${3:-"1"}
#<C-\\><C-N> -> go to normal mode, open file, navigate to correct line and column
command="<C-\\><C-N>:n $filename<CR>:call cursor($line,$column)<CR>"
# nvim default sockets are always nested somewhere in here
# see: https://github.com/neovim/neovim/blob/7c661207cc4357553ed2b057b6c8f28400024361/src/nvim/msgpack_rpc/server.c#L89
socket_directory="${XDG_RUNTIME_DIR}"
# use find to, well, find them all! (-type s -> socket)
nvim_sockets=($(find "$socket_directory"  -maxdepth 1 -type s -name 'nvim.*'))

for socket in "${nvim_sockets[@]}"
do
   #now it gets nasty...
   #socket is of shape something.user.pid.count
   #so to get the pid we do this:
   #replace "dots" in socket with linebreaks and return the second to last line (the pid)
   pid=($(echo $socket | tr "." "\n" | tail -n 2))
   echo $pid
   #now we want to get the cwd this process is running in
   #use lsof to get table for this pid, grep row with file descriptor cwd
   #now replace spaces in row with linebreaks and return the second to last line (the pid)
   pid_cwd=($(lsof -p $pid | grep cwd | tr " " "\n" | tail -n 1))
   #only if process cwd is the same as the pwd, run the command
   if [[  $PWD =~ ^"$pid_cwd"  ]]; then
      nvim --server $socket --remote-send "$command"
   fi
done
