#!/bin/bash
#
# install all of the plugins for gvim that are used by this repo.
# installation differs between macos and linux

# general setup

set -eu

#os="macos"
os=`uname`

# init sudo first, if a password is needed
# sudo ls > /dev/null

# check that the os is valid
if [ "$os" == "linux" ] || [ "$os" == "darwin" ] || [ "$os" == "Darwin" ]; then
    echo ""
else 
    echo "error: invalid operating system: $os"
    exit -1
fi

# todo: make sure gvim is installed, put in correct version for macos

# make sure all the directories exist 

# vim config directory
if [ ! -d "$HOME/.vim" ]; then
    mkdir ~/.vim
fi

# the vim autoload directory
if [ ! -d "$HOME/.vim/autoload" ]; then
    mkdir -p ~/.vim/autoload 
fi

# the vim/pathogen bundle directory
if [ ! -d "$HOME/.vim/bundle" ]; then
    mkdir -p ~/.vim/bundle 
fi

# the vim/pathogen bundle directory
if [ ! -d "$HOME/.vim/colors" ]; then
    mkdir -p ~/.vim/colors 
fi

# install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install the bundles
pushd ~/.vim/bundle

# install vim-go
git clone https://github.com/fatih/vim-go.git

# install neocomplete
git clone https://github.com/shougo/neocomplete.vim.git

popd

# install gotest
git clone https://github.com/buoto/gotests-vim.git ~/.vim/bundle/gotests-vim

# install molokai color scheme 
pushd ~/.vim/colors
curl -lsso molokai.vim https://raw.githubusercontent.com/fatih/molokai/master/colors/molokai.vim

popd

# install ctags (and vim gtk)
if [ "$os" == "linux" ]; then
    sudo apt-get install exuberant-ctags
    sudo apt-get install vim-gtk
else
    brew install ctags
fi

# install gotags
go get -u github.com/jstemmer/gotags

pushd ~/.vim/bundle

# install golint
go get -u github.com/golang/lint/golint

# Install godef
go get -v github.com/rogpeppe/godef
go install -v github.com/rogpeppe/godef
git clone https://github.com/dgryski/vim-godef ~/.vim/bundle/vim-godef

# Install tagbar
git clone https://github.com/majutsushi/tagbar.git

# Install nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# Install plugin directory
mkdir -p ~/.vim/plugin && curl -LSso ~/.vim/plugin/taboo.vim https://raw.githubusercontent.com/gcmt/taboo.vim/master/plugin/taboo.vim
curl -LSso ~/.vim/plugin/vim-gh-line.vim https://raw.githubusercontent.com/ruanyl/vim-gh-line/master/plugin/vim-gh-line.vim

popd
