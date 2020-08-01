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
echo "installing coc config"
ln -f configfiles/coc-settings.json $HOME/.config/nvim/coc-settings.json
#alacritty
echo "installing alacritty config"
mkdir -p $HOME/.config/alacritty
ln -f configfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml 
#fish
echo "installing fish config"
curl -fsSL https://get.oh-my.fish | fish
ln -f configfiles/config.fish $HOME/.config/fish/conf.d/config.fish 
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


