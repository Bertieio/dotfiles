set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-vividchalk'

call vundle#end()
filetype plugin indent on
syntax on
colorscheme vividchalk
