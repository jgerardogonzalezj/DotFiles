" enable syntax and plugins (for netrw)

syntax enable
filetype plugin on
filetype indent plugin on
syntax on

call plug#begin('~/.vim/plugged')
  "{{ vim-gitgo: Colorschem for go
  " Plug 'bitfield/vim-gitgo'
  "}}

  "{{ vim-go: Plugins for go.
  Plug 'fatih/vim-go'
  "}}

  "{{
  Plug 'fatih/molokai'
  Plug 'morhetz/gruvbox'
  "}}

  Plug 'edkolev/tmuxline.vim'
  Plug 'majutsushi/tagbar'
  Plug 'vim-syntastic/syntastic'

  "{{ to enable the powerline Plugin.
  Plug 'powerline/powerline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "}}

  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'

  Plug 'junegunn/vim-easy-align'

  Plug 'edkolev/promptline.vim'
  Plug 'junegunn/vim-plug'
  Plug 'tpope/vim-sensible'

  " NERD tree will be loaded on the first invocation of NERDTreeToggle
  " command
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " Multiple commands
  Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

  " On-demand loading on both conditions
  Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }

  "{{ Git integration
  " ---> git commands within vim <---
  Plug 'tpope/vim-fugitive'
  " ---> git changes on the gutter <---
  Plug 'airblade/vim-gitgutter'
  " ---> nerdtree git changes <---
  Plug 'Xuyuanp/nerdtree-git-plugin'
  "}}

  "{{ Autopairs
  " ---> closing XML tags <---
  " Plug 'alvan/vim-closetag'
  " ---> files on which to activate tags auto-closing <---
  " let g:closetag_filenames='*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
  " ---> closing braces and brackets <---
  Plug 'jiangmiao/auto-pairs'
  "}}

  "{{ TMux - Vim integration
  Plug 'christoomey/vim-tmux-navigator'
  "}}

  "{{ Configuring UltiSnips
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  "}}

  "{{ Configuring YouCompleteMe
  Plug 'valloric/youcompleteme', { 'do': './install.py'  }

  " ---> youcompleteme configuration <---
  let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

  " ---> compatibility with another plugin (ultisnips) <---
  let g:ycm_key_list_select_completion=[ '<C-n>', '<Down>'  ]
  let g:ycm_key_list_previous_completion=[ '<C-p>', '<Up>'  ]
  let g:SuperTabDefaultCompletionType='<C-n>'
  " ---> disable preview window <---
  set completeopt-=preview
  "}}
call plug#end()


" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=longest,list,full

" disable banner
let g:netrw_banner=0
" open in prior window
let g:netrw_browse_split=4
" open split to the right
let g:netrw_altv=1
" tree view
let g:netrw_liststyle=3
" 25% of current window
let g:netrw_winsize=25
" ignore files in gitignore
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide some folder
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set showmode

" Instead of failing command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue.
set cmdheight=2
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,latin1

set laststatus=0

" Display unprintable characters.
set list

" Use textmate-style white space characters
set showbreak=

set listchars=nbsp:‡,trail:·,tab:\|\ ,eol:¬

" Enable use of the mouse for all modes - helpful for resizing buffers
set mouse=a

set nocompatible

" set numbers
set nu

" Add git branch to statusline
set statusline=%t\ %m
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %y%=%l,%c\ %P

" enables bash aliases from vim shell
set shell=bash

" Show partial commands in the last line of the screen
set showcmd

" case-sensitive search if any caps
set smartcase

" spell check comments
" set spell

" If opening a file from :ls, :buffers, :files, etc. jump to open version
" of the file, if one exists
" set switchbuf=useopen

if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set background=dark

" Defining my <leader> key.
let mapleader=","

"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"           airline configuration part.
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
" set t_Co=256
" set notermguicolors
" let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts=1
let g:miniBufExplForceSyntaxEnable=1
" let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
" let g:airline_section_b = airline#section#create_left(['%{getcwd()}'])
let g:airline_section_c = airline#section#create_left(['file'])

" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif

" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⛕'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_symbols.dirty='❗'
" " let g:airline_symbols.dirty='⚡'
" let g:airline_left_alt_sep='⮁'
" let g:airline_right_alt_sep='⮃'
" let g:airline_symbols.readonly='⭤'

let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tmuxline#enabled=1

" let g:airline#extensions#tabline#alt_sep=1
" let g:airline#extensions#tabline#left_sep='▶'
" let g:airline#extensions#tabline#left_alt_sep='▶'
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=0
let g:airline#extensions#tabline#ignore_bufadd_pat='\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
let g:airline#extensions#tabline#show_close_button=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_splits=1
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tabline#show_tab_count=2
let g:airline#extensions#tabline#tab_nr_type=0
let g:airline#extensions#tabline#tabnr_formatter='tabnr'

let g:airline_stl_path_style='default'
let g:airline_skip_empty_sections=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#syntastic#error_symbol='E:'
let g:airline#extensions#syntastic#stl_format_err='%E{[%fe(#%e)]}'
let g:airline#extensions#syntastic#warning_symbol='W:'
let g:airline#extensions#syntastic#stl_format_warn='%W{[%fw(#%w)]}'

let g:airline_detect_iminsert=1

let g:airline#extensions#tmuxline#color_template='insert'
" let g:tmuxline_powerline_separators=0
" let g:tmuxline_separators={ 'left' : '', 'left_alt': '>', 'right' : '', 'right_alt' : '<', 'space' : ' ' }

" let g:bufferline_echo=0


let g:airline_filetype_overrides={
  \ 'coc-explorer':  [ 'CoC Explorer', '' ],
  \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
  \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
  \ 'gundo': [ 'Gundo', '' ],
  \ 'help':  [ 'Help', '%f' ],
  \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
  \ 'startify': [ 'startify', '' ],
  \ 'vim-plug': [ 'Plugins', '' ],
  \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
  \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
  \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
  \ }
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"
"/////////////////////////////////////////////////////////////////////////
"
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"        vim-go specifics configurations
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------

" vim-go coloring.
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1

" identifier resolution
let g:go_auto_type_info=1

" identifier highlighting.
let g:go_auto_sameids=0
set updatetime=100

" enable go-imports to auto update the imports used in a go program.
let g:go_fmt_command="goimports"

" Enable metalinter at saving a file.
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['vet', 'golint']
let g:go_metalinter_deadline="5s"
"
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"
"/////////////////////////////////////////////////////////////////////////
"
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"        Remapings
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------

" ---> navigating to the definition of a a symbol <---
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap <leader>tb :TagbarToggle<CR>

" Remaping used to navigate the 'tags'. As I'm using WSL , the CTRL key
" isn't working as expected.
nnoremap <leader>] <c-]>
nnoremap <leader>g] g<c-]>

" run the line in shell as a command, and the output replaces the current
" line.
nnoremap <leader>P !!sh<CR>

" Re-mapping twice the <BS> one to be used when at insert mode and the 2nd
" to be used when at normal mode.
inoremap <BS> <Nop>
nnoremap <BS> <Nop>
" If <BS> starts working (Lol), it is because a Plugin is remaping it too.
" to find which one is the 'guilty', run below line:
" :verbose imap <BS>
" Re-mapping twice the <Del> one to be used when at insert mode and the 2nd
" to be used when at normal mode.
inoremap <Del> <Nop>
nnoremap <Del> <Nop>

" Disable Enter in normal mode.
nnoremap <Return> <Nop>
nnoremap <Enter> <Nop>

" Disable the arrows
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
" Disable Home and End
inoremap <Home> <Nop>
inoremap <End> <Nop>

nnoremap ga <Plug>(EasyAlign)

" Open the .vimrc file to edit.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Inserts a line above in normal mode.
nnoremap <leader>O O<esc>j

" Inserts a line below in normal Mode.
nnoremap <leader>o o<esc>k

"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"
"/////////////////////////////////////////////////////////////////////////
"
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"        INDENTATION OPTIONS
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
" Indentation settings for using 4 spaces instead of tabs.
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

let g:AutoPairsMapBS=0

" set fo+=o fo-=r fo-=c
set formatoptions-=r
set formatoptions-=c
set formatoptions-=o
set formatoptions+=j
set formatoptions+=p
set formatoptions+=l

" Options related to wrapping lines.
let &showbreak='+++ '
set textwidth=0
set colorcolumn=80
" set columns=80
set breakindent
set linebreak
set nowrap
" set wm=5
" set wrap linebreak

set backspace=indent,eol,start

set ruler
set title
set cursorline
set autochdir
set showmatch

"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"
"//////////////////////////////////////////////////////////////////////////
"
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"        Commands and Autocommands
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------

command! MakeTags  !ctags -R .
command! Gor       !go run %
command! Gob       !go build %

" automatically rebalance windows on vim resize
autocmd! VimResized * :wincmd =

augroup vimedit
  autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd! BufWritePost,BufReadPost $MYVIMRC :call airline#load_theme()
  autocmd! BufWritePost,BufReadPost $MYVIMRC :AirlineRefresh
augroup END

" doautocmd vimedit BufWritePost,BufReadPost $MYVIMRC

nnoremap <leader>ar :AirlineRefresh<CR>:AirlineToggle<CR>:AirlineToggle<CR>

autocmd! BufEnter,FileType *
\ if &ft ==# 'c' || &ft ==# 'go' | colors molokai | AirlineRefresh |
\ elseif &ft ==# 'py' | colors gruvbox | AirlineRefresh |
\ else | colors slate | AirlineRefresh |
\ endif | call airline#load_theme()
