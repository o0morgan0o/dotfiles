export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:preview-tabbed;v:imgview'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'	

set -gx EDITOR nvim
set -gx VISUAL nvim

set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set --export NNN_FIFO "/tmp/nnn.fifo"

set -U fish_prompt_pwd_dir_length 0

zoxide init fish | source
