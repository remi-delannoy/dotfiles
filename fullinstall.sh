#!/bin/sh

#vim-plug install
echo "installing vim-plug"
curl -fsSLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "cloning the repo in .local/share/dotfiles"
mkdir -p "$HOME/.local/share"
cd "$HOME/.local/share"
git clone https://github.com/remi-delannoy/dotfiles.git
DOTFILE_DIR="$HOME/.local/share/dotfiles"
#init.vim install
echo "installing nvim config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.local/bin"
ln -sf "$DOTFILE_DIR/configfiles/init.vim" "$HOME/.config/nvim/init.vim" 
ln -sf "$DOTFILE_DIR/scripts/latex_compile.sh" "$HOME/.local/bin/latex_compile"
echo "installing nvim plugins"
nvim -es -u "$HOME/.config/nvim/init.vim" -i NONE -c "PlugInstall" -c "qa"
#alacritty
echo "installing alacritty config"
mkdir -p $HOME/.config/alacritty
ln -sf "$DOTFILE_DIR/configfiles/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml" 
#zsh
echo "installing zsh config in .config/zsh"
echo "ZDOTDIR=$HOME/.config/zsh"> $HOME/.zshenv
echo "You can get rid of $HOME/.zshenv by setting ZDOTDIR in /etc/zsh/zshenv"
mkdir -p "$HOME/.config/zsh"
mkdir -p "$HOME/.cache/zsh"
ln -sf "$DOTFILE_DIR/configfiles/zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$DOTFILE_DIR/configfiles/zshrc" "$HOME/.config/zsh/zshrc"
echo "installing prompt theme"
mkdir -p "$HOME/.local/share/zsh/theme"
ln -sf "$DOTFILE_DIR/misc/prompt_myprompt_setup" "$HOME/.local/share/zsh/theme/prompt_myprompt_setup"
#ls color
echo "installing nice colors for ls"
mkdir -p "$HOME/.local/share/dircolors/"
ln -sf "$DOTFILE_DIR/misc/dircolors.ansi-dark" "$HOME/.local/share/dircolors/dircolors.ansi-dark" 
#mako
echo "installing mako config"
mkdir -p "$HOME/.config/mako"
ln -sf "$DOTFILE_DIR/configfiles/config.mako" "$HOME/.config/mako/config"
#sway
echo "installing sway config"
mkdir -p "$HOME/.config/sway"
ln -sf "$DOTFILE_DIR/configfiles/config.sway" "$HOME/.config/sway/config"
#i3blocks
echo "installing i3blocks config"
mkdir -p "$HOME/.config/i3blocks"
ln -sf "$DOTFILE_DIR/configfiles/config.i3blocks" "$HOME/.config/i3blocks/config"
ln -sf "$DOTFILE_DIR/scripts/batterybar.bash" "$HOME/.config/i3blocks/batterybar.bash"
ln -sf "$DOTFILE_DIR/scripts/wireless_status.sh" "$HOME/.config/i3blocks/wireless_status.sh"
ln -sf "$DOTFILE_DIR/scripts/get_wallet.sh" "$HOME/.config/i3blocks/get_wallet.sh"


