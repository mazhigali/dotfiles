#!/bin/bash

export DOTFILES=$HOME/dotfiles

yum -y install zsh mc git curl neovim tmux xclip nnn rclone
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

rm .zshrc
git clone https://github.com/mazhigali/dotfiles.git
cd dotfiles
mkdir $HOME/.config
mkdir $HOME/.config/nvim

cp $DOTFILES/.zshrc       $HOME/.zshrc
cp $DOTFILES/init.vim       $HOME/.config/nvim/init.vim
#ln -s .zshrc       $HOME/.zshrc
#ln -s init.vim       $HOME/.config/nvim/init.vim


sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
