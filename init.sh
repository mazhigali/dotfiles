#!/bin/bash

export DOTFILES=$HOME/dotfiles

yum -y install https://repo.ius.io/ius-release-el7.rpm
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo

yum -y install zsh mc git curl neovim tmux2u xclip nnn rclone ripgrep htop nodejs

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions.git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm .zshrc
git clone https://github.com/mazhigali/dotfiles.git
cd dotfiles
mkdir $HOME/.config
mkdir $HOME/.config/nvim

cp $DOTFILES/.zshrc       $HOME/.zshrc
cp $DOTFILES/init.vim       $HOME/.config/nvim/init.vim
cp $DOTFILES/.tmux.conf       $HOME/

wget https://raw.githubusercontent.com/thestinger/termite/master/termite.terminfo
tic -x termite.terminfo

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
