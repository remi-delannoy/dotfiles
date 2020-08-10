#!/bin/sh

#vim-plug install
echo "installing vim-plug"
curl -fsSLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "cloning the repo"
git clone git@github.com:remi-delannoy/dotfiles.git
cd dotfiles
#init.vim install
echo "installing nvim config"
mkdir -p $HOME/.config/nvim
ln -f configfiles/init.vim $HOME/.config/nvim/init.vim 
echo "installing nvim plugins"
nvim -es -u $HOME/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"
#alacritty
echo "installing alacritty config"
mkdir -p $HOME/.config/alacritty
ln -f configfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml 
#zsh
echo "installing zsh config in .config/zsh"
echo "ZDOTDIR=$HOME/.config/zsh"> $HOME/.zshenv
echo "You can get rid of $HOME/.zshenv by setting ZDOTDIR in /etc/zsh/zshenv"
curl -fsSLo $HOME/.config/zsh/theme/prompt_agnoster_setup --create-dirs \
https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme
ln -f configfiles/zshrc $HOME/.config/zsh/.zshrc
ln -f configfiles/zshrc $HOME/.config/zsh/zshrc
#ls color
echo "installing nice colors for ls"
mkdir -p $HOME/.dircolors/
ln -f configfiles/dircolors.ansi-dark $HOME/.dircolors/dircolors.ansi-dark 
#mako
echo "installing mako config"
mkdir -p $HOME/.config/mako
ln -f configfiles/config.mako $HOME/.config/mako/config
#sway
echo "installing sway config"
mkdir -p $HOME/.config/sway
ln -f configfiles/config.sway $HOME/.config/sway/config
#i3blocks
echo "installing i3blocks config"
mkdir -p $HOME/.config/i3blocks
ln -f configfiles/config.i3blocks $HOME/.config/i3blocks/config
ln -f scripts/batterybar.bash $HOME/.config/i3blocks/batterybar.bash
ln -f scripts/wireless_status.sh $HOME/.config/i3blocks/wireless_status.sh
ln -f scripts/get_wallet.sh $HOME/.config/i3blocks/get_wallet.sh


