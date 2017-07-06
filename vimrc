" Don't try to be vi compatible
" Avoid possible side effects if `nocompatible` is already set
if &compatible | set nocompatible | endif

" Load Pathogen plugin manager
execute pathogen#infect()
execute pathogen#helptags()

" Filetype detection and systax highligting
filetype plugin indent on
syntax on

" Display line numbers
set number

" Show cursorline
set cursorline

" Tab general settings
set tabstop=4

" Listchars settings
set list
set listchars=tab:▸\ ,eol:¬
