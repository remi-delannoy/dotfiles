set fish_greeting
export EDITOR='nvim'
alias 'vim'='nvim'

#auto rescale image in feh
alias 'feh'='feh --scale-down'

# color for ls
eval (dircolors ~/.dircolors/dircolors.ansi-dark | sed -r 's/LS_COLORS=(.*)/set LS_COLORS \1/')

#vim keybindings
fish_vi_key_bindings

alias '...'='cd ../..'
alias 'gca'='git commit -a -v'
alias 'gst'='git status'

