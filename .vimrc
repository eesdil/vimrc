" vim:fdm=marker
" Identify platform {{{
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction

silent function! Neovim()
    return has('nvim')
endfunction
" }}}

" Basic {{{

language en_US
set number                      "Line numbers are good
" set relativenumber              "relative numbering
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line
" set colorcolumn=80
set hidden
syntax on
" set spell!
" set nospell
let mapleader=","
scriptencoding utf-8
set encoding=utf-8
set splitright
set splitbelow
set pastetoggle=<F12>

" hide menu
"set guioptions-=m
set guioptions-=T

" no blibking in gvim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"Swap files
set noswapfile
set nobackup
set nowb

set copyindent
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

set wrap!       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set foldnestmax=15
set foldenable
set foldminlines=2
"set foldlevel=20
set foldlevelstart=4

" save view after leaving window and restore it
" if Neovim()
    "set viewdir=$HOME/.nvim/views//
"else
    "set viewdir=$HOME/.vim/views//
"endif
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" to make quickfix window opening on the bottom
" au FileType qf wincmd J

au FileType typescript set foldmethod=syntax
au FileType typescript set foldlevel=1
au FileType javascript set foldmethod=syntax
" au FileType javascript set foldmethod=indent
au BufRead,BufWinEnter *.html,*.xml,*.xhtml set foldmethod=indent

"competion

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*node_modules/**
set wildignore+=*bower_components/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" set wildignore+=*.js,*.js.map
" set wildignore+=*.css

set wildignore+=*Lightness/scripts/**
set wildignore+=*.vbproj

" set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1

set clipboard+=unnamed
set hlsearch
set ignorecase
set smartcase
set incsearch

set laststatus=2
" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set updatetime=400

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" }}}
" Appearance {{{

set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" set lines=50
" set columns=120

if LINUX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
    set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
elseif OSX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    " set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
    " set guifont=Consolas:h12
    "set guifont=Inconsolata\ XL:h11
    " set guifont=Literation\ Mono\ Powerline\ Plus\ Nerd\ File\ Types:h12
    set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Pomicons:h13

elseif WINDOWS() && has("gui_running")
    set guifont=Consolas\ for\ Powerline:h13,Andale_Mono:h10,Menlo:h10,Consolas:h9,Courier_New:h10
endif

set guioptions-=r
set guioptions-=L

" }}}
if WINDOWS()
    call plug#begin('~\AppData\Local\nvim\plugged')
else
    call plug#begin('~/.config/nvim/plugged')
endif

Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'nelstrom/vim-markdown-folding'
Plug 'tpope/vim-markdown'
Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-airline/vim-airline'
" Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/deoplete.nvim'
" Plug 'mhartington/nvim-typescript'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'janko-m/vim-test'
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/denite.nvim'
" Plug 'airblade/vim-gitgutter'
" Colorschemes
" Plug 'altercation/vim-colors-solarized'
" Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'andbar-ru/vim-unicon'
Plug 'iCyMind/NeoSolarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'tomasiser/vim-code-dark'
Plug 'eesdil/vim-themes'
Plug 'mhinz/vim-janah'

call plug#end()

" colorscheme janah
" colorscheme PaperColor
colorscheme one
" set background=dark
set background=light
let g:one_allow_italics = 1
let g:airline_theme='one'
let vim_markdown_preview_github=1

" NERDTree {{{

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=[
            \ '\.vim$', '\~$',
            \ '\.js\.map$',
            \ '\.css'
            \ ]
" let NERDTreeIgnore=['\.vim$', '\~$']
let NERDTreeRespectWildIgnore = 0

map <C-e> :NERDTreeToggle<CR>
map <silent> <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" Close it automatically if this is the only window open
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
" }}}

" Fugitive {{{
set previewheight=20
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
nnoremap <silent> <leader>gm :Git log --graph --all --pretty=tformat:"\%C(yellow)\%h\%Creset\%C(cyan)\%C(bold)\%d\%Creset \%C(cyan)(\%cr)\%Creset \%C(green)\%ce\%Creset \%s"<CR>
" }}}

" tcomment {{{
map <Leader>c<space> :TComment<CR>
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i
let g:tcomment#replacements_xml={}

call tcomment#type#Define('java', '// %s')
call tcomment#type#Define('typescript', '// %s')
call tcomment#type#Define('sqlserver', '-- %s')
" }}}

" EasyMotion {{{
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" }}}

" {{{ terminal
:tnoremap <Esc> <C-\><C-n>
" }}}
" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

nmap <silent> <leader>f0 :set foldlevel=0<CR>
nmap <silent> <leader>f1 :set foldlevel=1<CR>
nmap <silent> <leader>f2 :set foldlevel=2<CR>
nmap <silent> <leader>f3 :set foldlevel=3<CR>

" typescript {{{
au FileType typescript map <C-]> :TSType<CR>
au FileType typescript nmap <leader>i :TSImport<CR>

" }}}
" deoplete  {{{
let g:deoplete#enable_at_startup = 1
" }}}
" neosnippet {{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" }}}
" denite {{{
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '*~', '*.o', '*.exe', '*.bak',
  \ '.DS_Store', '*.pyc', '*.sw[po]', '*.class',
  \ '.hg/', '.git/', '.bzr/', '.svn/',
  \ '**/node_modules/', 'bower_components/', 'tmp/', 'log/', 'vendor/ruby',
  \ '.idea/', 'dist/',
  \ 'tags', 'tags-*'])
call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-k>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)
" }}}
" custom functions {{{
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap <leader>w :StripTrailingWhitespaces<CR>


function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
    let txt = '"' . comment . expansionString . nblines
    return txt
endfunction
set foldtext=MyFoldText()
" }}}

" ale {{{
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:airline#extensions#ale#error_symbol='• '
let g:airline#extensions#ale#warning_symbol='• '

" let g:ale_completion_enabled = 1
" }}}

" Ctrl P {{{
let g:ctrlp_cmd = 'CtrlPMRU'

" }}}
" Open in browser {{{
nnoremap <leader>of :exe ':silent !open -a /Applications/Firefox.app %'<CR>
nnoremap <leader>oc :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <leader>og :exe ':silent !open -a /Applications/Google\ Chrome.app %'<CR>
nnoremap <leader>os :exe ':silent !open /Applications/Safari.app %'<CR>
" }}}
" Autoformat {{{
noremap <leader>f :Autoformat<CR>
" }}}
