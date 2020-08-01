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
#fish
echo "installing fish config"
curl -fsSL https://get.oh-my.fish | fish
curl -fsSLo $HOME/.config/fish/conf.d/config.fish --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/configfiles/config.fish
#ls color
echo "installing nice colors for ls"
curl -fsSLo $HOME/.dircolors/dircolors.ansi-dark --create-dirs \
    https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/configfiles/dircolors.ansi-dark



