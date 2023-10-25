#!/bin/bash

#i3-msg focus "right"

if ! tmux has-session -t "main" 2> /dev/null; then
  tmux new-session -s "main" -c "main" -d
  alacritty -e tmux
fi

#i3-sensible-terminal
#alacritty
#/bin/bash
#alacritty -e "tmux switch-client -t \"main\""
#alacritty -e 'tmux attach-session -t "main"; zsh'

tmux split
i3-msg [title=tmux] split
i3-msg [title=Alacritty] focus
#tmux switch-client -t "main"
