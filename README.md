Installation:

    git clone https://github.com/bvt/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

    cd ~/.vim
    git submodule init
    git submodule update

Pathogen:

    cd ~/.vim
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

Quit vim restart and type
    :Helptags


Unistall 

git submodule deinit bundle/vim-rvm
git rm bundle/vim-rvm
git rm --cached bundle/vim-rvm
rm -rf .git/modules/bundle/vim-rvm
