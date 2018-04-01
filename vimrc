" Don't try to be vi compatible
" Avoid possible side effects if `nocompatible` is already set
if &compatible | set nocompatible | endif
"
" Package manager configuration
"
" Choose package manager: 'Vundle' or 'vim-plug'
" let s:package_manager='Vundle'
let s:package_manager='vim-plug'
" Set root config path depending on vim version: Windows, vim8 or neovim
if has('win32')
  let s:root_path=expand('~/vimfiles')
else
  if has('nvim')
    let s:root_path=expand('~/.config/nvim')
  else
    let s:root_path=expand('~/.vim')
  endif
endif
" vim-plug configuration
if s:package_manager == 'vim-plug'
  if empty(glob(s:root_path . '/autoload/plug.vim'))
      silent execute '!curl -fLo ' . s:root_path . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync
      " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin(s:root_path . '/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'vim-syntastic/syntastic'
  Plug 'mattn/emmet-vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'rakr/vim-one'
  Plug 'tomasr/molokai'
  call plug#end()
endif

" Vundle configuration
" Setup Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
if s:package_manager == 'Vundle'
  if empty(glob(s:root_path . '/bundle/Vundle.vim'))
      silent execute '!mkdir -p ' . s:root_path . '/bundle'
      silent execute '!git clone https://github.com/VundleVim/Vundle.vim.git ' . s:root_path . '/bundle/Vundle.vim'
      autocmd VimEnter * PluginInstall
  endif

  filetype off                 " required

  " set the runtime path to include Vundle and initialize

  " (31/03/18): Newer implementation, using let to construct the value to
  " assign to rtp
  let &rtp = &rtp . ',' . s:root_path . '/bundle/Vundle.vim'
  call vundle#begin(s:root_path . '/bundle')

  " (19/03/18): New implementation, with vim8 and neovim compatibility
  " if has('win32')
  "   set rtp+=~/vimfiles/bundle/Vundle.vim
  "   call vundle#begin()
  " else
  "   if has('nvim')
  "     set rtp+=~/.config/nvim/bundle/Vundle.vim
  "     call vundle#begin('~/.config/nvim/bundle')
  "   else
  "     set rtp+=~/.vim/bundle/Vundle.vim
  "     call vundle#begin('~/.vim/bundle')
  "   endif
  " endif

  " Old implementation, before vim8 and neovim compatibility
  " if has('win32')
  "   set rtp+=~/vimfiles/bundle/Vundle.vim
  " else
  "   set rtp+=~/.vim/bundle/Vundle.vim
  " endif
  " call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  " Keep Plugin commands between vundle#begin/end.
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'mattn/emmet-vim'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'rakr/vim-one'
  Plugin 'tomasr/molokai'
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
endif

" Systax highligting
syntax on
" Set encoding
set encoding=utf-8

" Appearance options for GUI (MacVim, gVim)
if has('gui_running')
  set lines=40
  set columns=132
  if has('win32')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
  else
    let s:uname = system('uname')
    if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline:h14
    elseif s:uname == "Linux\n"
      set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    else
    endif
  endif
endif

" Use true color in terminal (supported in Cygwin, iTerm2, gnuterm)
set termguicolors

" Colorscheme Molokai
" colorscheme molokai

" Colorscheme one (Atom one clone)
" I currently prefer the dark version, both in gui and in terminal. Leave the if
" sentence in case I change my mind in the future
" if has('gui_running')
"   set background=dark
" else
"   set background=dark
" endif
set background=dark
silent! colorscheme one

" Colorscheme Solarized
" if has('gui_running')
"   set background=dark
" else
"   set background=dark
" let g:solarized_termcolors=256
" endif
" colorscheme solarized

" Display line numbers
set number

" Show cursorline
set cursorline

" Show color column
set colorcolumn=80

" Tab general settings
set shiftwidth=2
" Indentation with spaces
set expandtab
set softtabstop=2
" Indentation with hard tabs
" set tabstop=2

" Listchars settings
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Buffer settings
" Allow hidden modified buffers
set hidden
"
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
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree plugin settings
" Start NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" Start NERDTree automatically when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start NERDTree automatically when opening a directory
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd o | endif
" Map <C-n> to NERDTReeToggle in normal mode
nnoremap <C-n> :NERDTreeToggle<CR>

" Syntastic plugin settings
set statusline+=%#warningmsg#
if exists ('*SyntasticStatuslineFlag') | set statusline+=%{SyntasticStatuslineFlag()} | endif
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
