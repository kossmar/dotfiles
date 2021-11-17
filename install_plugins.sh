
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

# install NERDCommenter
cd ~/.vim/bundle
git clone https://github.com/preservim/nerdcommenter.git

# Install plugin directory
mkdir -p ~/.vim/plugin && curl -LSso ~/.vim/plugin/taboo.vim https://raw.githubusercontent.com/gcmt/taboo.vim/master/plugin/taboo.vim
