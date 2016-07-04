" 2016/01/01: Don't need compatible mode 
set nocompatible


" ### Plugins (vim-plug) ###  

" Load vim-plug if not already installed
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" :PlugInstall installs plugins

call plug#begin('~/.vim/plugged')

" fzf for searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" We need pseudocli for some of junegunn's other plugins
Plug 'junegunn/vim-pseudocl'
" search with ack
Plug 'mileszs/ack.vim'
" some git integration and status info
Plug 'tpope/vim-fugitive'
" file browser on the left
Plug 'scrooloose/nerdtree'
" and make the nerdtree file browser consistent between tabs
Plug 'jistr/vim-nerdtree-tabs'
" more python support
Plug 'klen/python-mode'
" surround things with other things
Plug 'tpope/vim-surround'
" syntax highlighting
Plug 'scrooloose/syntastic'
" complementary mappings
Plug 'tpope/vim-unimpaired'
" solarized
Plug 'altercation/vim-colors-solarized'
" GO integration
Plug 'fatih/vim-go'
" gradle integration
Plug 'tfnico/vim-gradle'
" more sane regex
Plug 'nelstrom/vim-visual-star-search'
" fuzzy search for files using ctrl+p
Plug 'kien/ctrlp.vim'
" open alternate files (eg foo.h quick opens foo.c)
Plug 'vim-scripts/a.vim'
" Smart alignment of text.
Plug 'junegunn/vim-easy-align'
" Use ctrl+h,j,k,l to navigate tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'
" Use github-flavored markdown highlighting, not canonical md highlighthing
Plug 'jtratner/vim-flavored-markdown'
" Prettier status line.
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Commenting with gc{motion}
Plug 'tpope/vim-commentary'
" Define custom text objects. Required for vim-textobj-entire
Plug 'kana/vim-textobj-user'
" Add 'whole file' objects with ae and ie (ignores leading/trailing whitespace)
Plug 'kana/vim-textobj-entire'
" Allow . repeating using vim-surround
Plug 'tpope/vim-repeat'
" Smarter CTRL-A and CTRL-X for addition/subtraction
Plug 'tpope/vim-speeddating'
" Auto-conversion to snake, camel, mixed, upper  case with crs, crc, crm, cru
Plug 'tpope/vim-abolish'
" Allow smarter pasting.
Plug 'svermeulen/vim-easyclip'
" Word objects for columns of text
Plug 'coderifous/textobj-word-column.vim'
" latex support
Plug 'lervag/vimtex'
" Readline-style bindings in vim
Plug 'tpope/vim-rsi'
" More information for <ctrl>+a character information, including unicode
Plug 'tpope/vim-characterize'
" Fancy pants auto completion
Plug 'valloric/YouCompleteMe'
" Color TOML
Plug 'cespare/vim-toml'
" Better markdown support
Plug 'plasticboy/vim-markdown'
" Better searching and highlighting defaults.
Plug 'junegunn/vim-oblique'
" Show contents of registers using " and @ in insert and <C-CR> in insert
Plug 'junegunn/vim-peekaboo'
" Browse git commits. fugitive must be installed first.
" :GV to open commit browser
" :GV! will only list commits for the current file
" :GV over visual range will list commits for the lines
" You can pass git log options to the command, e.g. :GV -S foobar.
Plug 'junegunn/gv.vim'
" Turn on[off] color coding parentheses with :RainbowToggle
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0
" Tmux integration like writing to another pane.
Plug 'tpope/vim-tbone'
" Show indentation levels with :IndentLinesToggle
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
" Open the current file[pwd] in finder with go{f,F}.
Plug 'justinmk/vim-gtfo'
" Better Javascript highlighting.
Plug 'pangloss/vim-javascript'
" Coffeescript support
Plug 'kchmck/vim-coffee-script'
" Support for Rust
Plug 'rust-lang/rust.vim'
" Highlighting for docker files
Plug 'honza/dockerfile.vim'
" Help with unicode digraphs
Plug 'chrisbra/unicode.vim'

call plug#end()

" ### Customizations ### 

" Use system clipboard for pasting and yanking.
set clipboard=unnamed
" Remap mark to gm, allowing easyclip to use m for move
nnoremap gm m

" Remove the delay in ESC leaving a mode (ttimeoutlen)
set timeoutlen=1000 ttimeoutlen=0

" Command for fzf stolen from someone else. Their description:
" This maps \ff in command-line mode to invoke fzf file search and lets you
" insert the filename in any vim command. So I can type :sp ,ff and then the
" filename. or :vs or :tabnew. So this gives a lot of flexibility wrt to how
" you want to open the file.
cnoremap <Leader>ff <C-R>=fzf#run({'down': '40%'})<CR><CR>

" Add a :Reload command to reload the buffer. This is the same behavior as
" :edit but I always forget about it.
command! Reload execute "edit"

" Align things using ga as a motion for easy-align.
" ga used to inspect characters.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Color frontmatter in markdown files.
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_math = 1
" Open table of contents with <leader>lt
autocmd Filetype markdown map <buffer> <leader>lt :Toc<CR>
" highlight bold
autocmd FileType markdown highlight htmlBold ctermbg=60

" Set paste by default when pasting from insert and command mode.
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste

" YouCompleteMe (YCM)
" Let eclim and YouCompleteMe play nice.
let g:EclimCompletionMethod = 'omnifunc'
" From: https://github.com/Valloric/YouCompleteMe/issues/53 
" Turn off YCM
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
" Turn on YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" vim latex
" autocomplete citations with ycm. :h vimtex-complete-youcompleteme
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]

" Syntastic
let g:syntastic_mode_map={ 'mode':'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': [] }
let g:syntastic_python_checkers = ['pep8', 'python', 'pyflakes']
" This tells syntastic to use the location list for displaying things.
let g:syntastic_auto_loc_list=1
" Ignore the things that yelp does. 
" TODO: Should probably only do this conditionally.
let g:syntastic_python_pep8_args='--ignore=E501,W191'
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
" And now we disable pyflakes using the quickfix list to leave the quickfix
" buffer alone, which does weird things to syntastic.
let g:pyflakes_use_quickfix = 0
let g:pymode_lint_write = 0
let g:syntastic_javascript_checkers = ['jshint']

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

" PythonMode
let g:pymode_folding = 0 " No auto code folding

" Don't move the cursor when you join lines with J
:nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" Command-T
let g:CommandTMaxFiles=999999

" Airline
let g:airline_theme='murmur'
" Don't want to require patched font, so change separator.
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ---------- settings ---------
" The leader was mapped to comma, but his is the reverse find function of the
" ; command. I'm going to not map this and just leave leader the same with
" \. I think I'd prefer to use reverse find a lot than leader. But we'll see.
"let mapleader = ","
"noremap \ ,
set mouse=a

" Filetype highlighting
filetype on
filetype plugin indent on
syntax on

" Turn on the matchit plugin that will enable jumping to pairs of things like
" matching open and close xml tags with %.
runtime macros/matchit.vim

" Show what you are typing mid-command
set showcmd

" Indentation/tabs
set autoindent

" 2 spaces by default
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Except HTML - 2 spaces
autocmd BufWinEnter *.html setlocal tabstop=2
autocmd BufWinEnter *.html setlocal expandtab
autocmd BufWinEnter *.html setlocal shiftwidth=2
autocmd BufWinEnter *.html setlocal expandtab

" Treat all *.md files as markdown, not just README.md. Otherwise vim by
" default treats *.md files as modula-2: https://github.com/tpope/vim-markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Color scheme and font
colorscheme buddy
set guifont=Monaco:h12

" Highlight current line
set cursorline

" Maintain more text around the cursor
set scrolloff=3

" More intelligent backspace and left/right movement
set backspace=eol,start,indent
set whichwrap=b,s,h,l,<,>,[,]

" Hidden buffer support. I think this lets us navigate away from a buffer,
" even when doing ':bnext', without giving the 'override with !' error.
set hidden

" Disable annoying messages, swap file already exists
set autoread
set shortmess+=IA

" Longer history
set history=1000
" By default the up and down arrows filter commands in the history--eg if you
" type ':e ' and then hit up, you'll see only the previous commands that
" started with that. If you do that and then hit <C-p>, however, you won't. So
" let's fix that behavior.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Case-smart searching (case-sensitive only if capital letter in search)
set ignorecase
set smartcase

" Incremental search
set incsearch

" And we're going to add commands that remap & to :&& in normal and visual
" modes. & normally reruns the substitution without the same flags, but this
" isn't super useful, so per the advice of Practical Vim I'm going to remap it
" to just redo the same thing.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" We're also going to add a toggle for highlighting search to c-l.
" According to Practical Vim, normally <C-l> clears and redraws the creen.
" This mapping builds on top of the usual behavior by muting search
" highlighting. FOR WHATEVER REASON THIS IS NOT WORKING
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Tab completion
set wildmode=longest,list
set wildignore=*.pyc

" Visual bell instead of beep
set visualbell

" keep backups and temp files in ~.vim/
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" set default split opening position to be below and to the right of currently active split
set splitbelow
set splitright

" Tags - recursively check parent directories for tags file
set tags+=./.tags,.tags,../.tags,../../.tags

" Filetypes
autocmd BufEnter *.mako setlocal filetype=html

" Unicode stuff. This is taken from the following two places, both of which
" have good explanations:
" http://vim.wikia.com/wiki/Working_with_Unicode
" http://stackoverflow.com/questions/16507777/vim-set-encoding-and-fileencoding-utf-8
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,latin1
endif

" This is a function from Practical Vim that executes something for every item
" in the argument list. It is also available as a plugin, with README
" information and things here (also see the books for usage):
" https://github.com/nelstrom/vim-qargs
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" ---------- mappings ---------

" Make %% a shortcut for %:h on the command line. Normally if you do 
" ':edit %<Tab>' it will show you the relative path to the file, including the
" filename. If you don't want the filename, you do ':edit %:h<Tab>'. This
" remapping will give allow us to get the same functionality by doing
" ':edit %%'.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Typos and things I don't want to do
nmap Q <ESC>
nmap :Q :q
nmap :W :w
nmap :WQ :wq

" Toggle fix quix and location list
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" This is being funky and under sone circumstance the quickfix toggle is also
" opening the location list toggle. Annoying. Will wait to investigate more,
" might be something to do with Syntastic.
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

" Function key shortcuts
map <F1> <nop>
map <F3> :set hlsearch! hlsearch?<CR>
map <F6> :NERDTreeClose<CR>
map <F7> :NERDTreeFind<CR> "TODO combine with F6 to make toggle
map <F8> :TagbarToggle<cr>
map <F9> :!/usr/bin/ctags -L <(find . -name '*.py') --fields=+iaS --python-kinds=-i --sort=yes --extra=+q<cr>

" Leader shortcuts
" open current buffer in new tab
map <Leader>s :tab split<CR>
map <Leader>n :tabnew<CR>
map <Leader>m :tabm

" git diff in new tab
map <Leader>f :tab split<CR>:Gdiff canon/master<CR>
map <Leader>g :tab split<CR>:Ggrep 
map <Leader>i Oimport pdb; pdb.set_trace()<ESC>

" -------- 

" 2016/01/01: Support all colors 
set t_Co=256

" 2016/04/30: From Practical Vim, makes Vim treat all numerals as decimals
set nrformats=

" 2016/05/02: Highlight 80 character column point
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn guibg=#2d2d2d ctermbg=246
else
  au bufwinenter * let w:m2=matchadd('errormsg', '\%>80v.\+', -1)
endif

" 2016/05/01: Relative line numbering and show line numbers
set relativenumber
set number

" 2016/05/01: Remap escape key
inoremap jk <ESC>

