#!/bin/bash

#i3-msg focus "right"
#alacritty --config-file=$HOME/.config/alacritty/alacritty.toml

alacritty --config-file=$HOME/.config/alacritty/alacritty.yml -e $SHELL -c 'tmux attach -t "main" || tmux'

#if ! tmux has-session -t "main" 2>/dev/null; then
 # tmux new-session -s "main" -c "main" -d
 # alacritty --config-file=$HOME/.config/alacritty/alacritty.yml -e $SHELL -c 'tmux attach -t "main" || tmux'
  #alacritty --config-file ~/.config/alacritty/alacritty.toml
  #alacritty --config-file ~/.config/alacritty/alacritty.toml
#else

#i3-sensible-terminal
#alacritty
#/bin/bash
#alacritty -e "tmux switch-client -t \"main\""
#alacritty -e 'tmux attach-session -t "main"; zsh'
#alacritty --config-file=$HOME/.config/alacritty/alacritty.toml -e $SHELL -c 'tmux switch-client -t "main" && tmux split-window -h'
#alacritty --config-file=$HOME/.config/alacritty/alacritty.toml -e $SHELL -c 'tmux attach -t "main" && tmux split-window -h'

#alacritty --config-file=$HOME/.config/alacritty/alacritty.toml -e $SHELL -c 'tmux split-pane -h -t ["main":]4'
#tmux split
#i3-msg [title=tmux] splialacrit
#i3-msg [title=Alacritty] focus
#tmux switch-client -t "main"
#fi
