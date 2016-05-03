"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Krittika D'Silva's vimrc (kdsilva@uw.ed)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Practical Vim's recommendation
set nocompatible
filetype off " Trying vundle 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"Better whitespace
"Bundle 'ntpeters/vim-better-whitespace' 
" highlight ExtraWhitespace ctermbg=blue // TODO: change to different color



" If there is a slash in the bundle-name
" it automatically installs from GitHub.
Bundle 'gmarik/vundle'

"Plugins taken from:
"https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
"very nice file browser
Bundle 'scrooloose/nerdtree'
" some markdown support
Bundle 'https://github.com/plasticboy/vim-markdown.git'

" git tools
Bundle 'tpope/vim-fugitive'

" zen coding (for HTML)
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" jump around documents
Bundle 'Lokaltog/vim-easymotion'

" path searching
Bundle 'git://git.wincent.com/command-t.git'

" formatting for js
Bundle "pangloss/vim-javascript"

" more js syntax options
Bundle 'maksimr/vim-jsbeautify'

" pretty sweet linting/error checking. Works on save
Bundle 'https://github.com/scrooloose/syntastic.git'

" search with ack
" Bundle 'mileszs/ack.vim'

" paste
set pastetoggle=<C-P> " Ctrl-P toggles paste mode


" syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
     let g:syntastic_check_on_wq = 0


" all of your plugins must be added before the following line
call vundle#end()            
filetype plugin indent on  

" Highlight current line
set cursorline

" Spell check
" pressing \ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" remap  TODO
map <F6> :NERDTreeToggle<CR>   

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"Fix backspace problems 
set backspace=indent,eol,start

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2    


" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Highlight search maches 
set hlsearch

"Color scheme
colorscheme solarized 
set guifont=Monaco:h12
let g:solarized_termcolors=256

" Show line numbers
set number

" Remapped the escape key
inoremap jk <ESC>

" iletype highlighting
"filetype on
"filetype plugin indent on
syntax on

" Case-smart searching 
set ignorecase
set smartcase

" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Audoindenting 
set autoindent

" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
   silent !mkdir ~/.vim/backups > /dev/null 2>&1
   set undodir=~/.vim/backups
   set undofile
endif
let $GOPATH="/Users/kdsilva/Dropbox/_winter_2016/452/labs/1"
