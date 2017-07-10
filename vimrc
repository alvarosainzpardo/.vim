" Don't try to be vi compatible
" Avoid possible side effects if `nocompatible` is already set
if &compatible | set nocompatible | endif

" Vundle configuration
" Setup Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
filetype off                 " required

" set the runtime path to include Vundle and initialize
if has('win32')
  set rtp+=~/vimfiles/bundle/Vundle.vim
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rakr/vim-one'
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Systax highligting
syntax on
" Set encoding
set encoding=utf-8

" Appearance options for GUI (MacVim, gVim)
if has('gui')
  set lines=40
  set columns=132
  if has('win32')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
  else
    let s:uname = system('uname')
    if s:uname == 'Darwin\n'
      set guifont=Meslo\ LG\ S\ for\ Powerline:h14
    endif
    if s:uname == 'Linux\n'
      set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    endif
  endif
endif

" Colorscheme Solarized (dark background)
if has('gui')
  set background=dark
else
  set background=light
  let g:solarized_termcolors=256
endif
colorscheme solarized
"
" Display line numbers
set number

" Show cursorline
set cursorline

" Tab general settings
set shiftwidth=2
" Indentation with spaces
set expandtab
set softtabstop=2
" Indentation with hard tabs
" set tabstop=2

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

" NERDTree plugin settings
" Start NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
