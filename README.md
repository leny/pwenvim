# leny/pwenvim

> My **vim** configuration files

* * *

**pwenvim** is an utility repository to store my vim configuration files, separated from my [dotfiles](https://github.com/leny/pwendok), since my dotfiles are more "machine-based", and my vim config is more "system-wise" (you don't understand? me neither.).

* * *

## Install

Launch the following commands (you need to remove existing vim configuration files before):

    cd && git clone https://github.com/leny/pwenvim ~/.pwenvim
    ln -sfv ~/.pwenvim/vimrc ~/.vimrc
    ln -sfv ~/.pwenvim/vim ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    cd ~/.pwenvim/vim/bundle/YouCompleteMe && ./install.py
