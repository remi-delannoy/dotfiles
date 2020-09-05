#!/bin/sh

#vim-plug install
echo "installing vim-plug"
curl -fsSLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#init.vim install
echo "installing nvim config"
curl -fsSLo $HOME/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/configfiles/init.vim 
echo "installing nvim plugins"
nvim -es -u $HOME/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"
#alacritty
curl -fsSLo $HOME/.config/alacritty/alacritty.yml --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/configfiles/alacritty.yml
#zsh
echo "installing zsh config in .config/zsh"
echo "ZDOTDIR=$HOME/.config/zsh"> $HOME/.zshenv
echo "You can get rid of $HOME/.zshenv by setting ZDOTDIR in /etc/zsh/zshenv"
curl -fsSLo $HOME/.config/zsh/.zshrc --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/configfiles/zshrc
mkdir -p $HOME/.cache/zsh
echo "installing prompt theme"
curl -fsSLo $HOME/.local/share/zsh/theme/prompt_myprompt_setup --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/misc/prompt_myprompt_setup
#ls color
echo "installing nice colors for ls"
curl -fsSLo $HOME/.local/share/dircolors/dircolors.ansi-dark --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/misc/dircolors.ansi-dark


