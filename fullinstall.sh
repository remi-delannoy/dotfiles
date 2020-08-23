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
mkdir -p $HOME/.local/bin
ln -f configfiles/init.vim $HOME/.config/nvim/init.vim 
ln -f scripts/latex_compile.sh $HOME/.local/bin/latex_compile
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
mkdir -p $HOME/.config/zsh
mkdir -p $HOME/.cache/zsh
ln -f configfiles/zshrc $HOME/.config/zsh/.zshrc
ln -f configfiles/zshrc $HOME/.config/zsh/zshrc
echo "installing prompt theme"
mkdir -p $HOME/.local/share/zsh/theme
ln -f configfiles/prompt_myprompt_setup $HOME/.local/share/zsh/theme/prompt_myprompt_setup
#ls color
echo "installing nice colors for ls"
mkdir -p $HOME/.local/share/dircolors/
ln -f configfiles/dircolors.ansi-dark $HOME/.local/share/dircolors/dircolors.ansi-dark 
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


