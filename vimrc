" Don't try to be vi compatible
" Avoid possible side effects if `nocompatible` is already set
if &compatible | set nocompatible | endif

" Load Pathogen plugin manager
execute pathogen#infect()
execute pathogen#helptags()

" Filetype detection and systax highligting
filetype plugin indent on
syntax on

" Colorscheme Solarized (dark background)
set background=dark
" set background=light
" let g:solarized_termcolors=256
colorscheme solarized
"
" Display line numbers
set number

" Show cursorline
set cursorline

" Tab general settings
set tabstop=4

" Listchars settings
set list
set listchars=tab:▸\ ,eol:¬

" Plugin specific settings

" Airline plugin settings
" Always show statusbar, not only when screen is split
set laststatus=2
" Show Powerline special symbols. For this option to work, special fonts
" , patched with the special characters, must be installed and one of them used in the terminal where vim is
" used. See documentation
let g:airline_powerline_fonts = 1
" If the patched fonts are not used, UTF-8 symbols can be used
" let g:airline_unicode_fonts = 1
