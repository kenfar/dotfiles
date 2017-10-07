#!/usr/bin/env bash

# install pathogen:
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
      curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install bundles:
cd ~
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/scrooloose/syntastic.git
git clone git://github.com/Lokaltog/vim-powerline.git
git clone git://github.com/ervandew/supertab.git
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
