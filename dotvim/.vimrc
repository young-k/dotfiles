" Vundle
set nocompatible
filetype off   
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Packages
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'

" End Vundle
call vundle#end()

filetype plugin indent on
syntax on
colorscheme dracula
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set number
let mapleader="," " Setting for NERDCommenter
