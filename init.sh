#!/bin/bash

yum -y install zsh, mc, git, curl, neovim, tmux
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/mazhigali/dotfiles.git
cd dotfiles

ln -s .zshrc       $HOME/.zshrc
ln -s init.vim       $HOME/.config/nvim/init.vim