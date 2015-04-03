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
" }}}
" Windows Compatible {{{
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if WINDOWS()
    "set runtimepath=$HOME/vimfiles,$VIMRUNTIME
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME

    " set windows behaviour for win
    " source $VIMRUNTIME/mswin.vim
    "behave mswin
endif

if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


" Bundles {{{
filetype off
" if WINDOWS()
"     set rtp+=~/.vim/bundle/Vundle.vim/
"     let path='~/.vim/bundle'
"     call vundle#begin(path)
" elseif OSX() || LINUX()
"     set rtp+=~/.vim/bundle/Vundle.vim
"     call vundle#begin()
" endif


" NeoBundle 'gmarik/Vundle.vim'

" colorscheme {{{
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'baeuml/summerfruit256.vim'
NeoBundle 'chrishunt/color-schemes'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'duythinht/inori'
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'moll/vim-bbye'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Son-of-Obisidian'
NeoBundle 'vim-scripts/Visual-Studio'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'zenorocha/dracula-theme'

" }}}
" Snippet {{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'eesdil/bootstrap-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'matthewsimo/angular-vim-snippets'
" NeoBundle 'MarcWeber/vim-addon-mw-utils'
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'garbas/vim-snipmate.git'
" NeoBundle 'msanders/snipmate.vim'
" NeoBundle 'tomtom/tlib_vim'
" }}}
" Languages {{{
" NeoBundle 'itspriddle/vim-jquery.git'
" NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'marijnh/tern_for_vim'
" NeoBundle 'skammer/vim-css-color'
" NeoBundle 'vim-scripts/JavaScript-Indent'
" NeoBundle 'vim-scripts/OOP-javascript-indentation'
" NeoBundle 'vim-scripts/Simple-Javascript-Indenter'
" NeoBundle 'vim-scripts/visual_studio.vim'
NeoBundle 'OrangeT/vim-csharp'
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'ap/vim-css-color'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'clausreinke/typescript-tools'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'groenewege/vim-less.git'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hoffstein/vim-tsql'
NeoBundle 'jason0x43/vim-js-indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'nelstrom/vim-markdown-preview'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tsaleh/vim-align'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'vim-scripts/sql.snippets'
NeoBundle 'vim-scripts/sqlserver.vim'

" NeoBundle 'jtratner/vim-flavored-markdown.git'
" NeoBundle 'lukaszb/vim-web-indent'
" NeoBundle 'vim-scripts/eclipse.vim'
" NeoBundle 'othree/html5.vim'
" }}}
" Projects {{{
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree.git'
" }}}
" Other {{{
" NeoBundle 'bling/vim-airline'
" NeoBundle 'c0r73x/vimdir.vim'
" NeoBundle 'mhinz/vim-signify'
" NeoBundle 'xolox/vim-easytags'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'amiorin/vim-fenced-code-blocks'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gregsexton/gitv'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kablamo/vim-git-log'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/gist-vim'
NeoBundle 'millermedeiros/esformatter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'reedes/vim-wheel'
NeoBundle 'rking/ag.vim'
NeoBundle 'ryanoasis/vim-webdevicons'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skwp/YankRing.vim'
NeoBundle 'skwp/vim-easymotion'
NeoBundle 'spf13/vim-autoclose'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tomtom/tcomment_vim.git'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'trapd00r/vim-syntax-vidir-ls'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'vim-scripts/closetag.vim'
NeoBundle 'vim-scripts/lastpos.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-shell'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" NeoBundle 'Shougo/vimshell.vim'
" NeoBundle 'Valloric/YouCompleteMe'
" NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'chrisbra/changesNeoBundle'
" NeoBundle 'mklabs/vim-issues'
" NeoBundle 'vim-scripts/AutoTag.git'
" NeoBundle 'vim-scripts/IndexedSearch'
" NeoBundle 'xsunsmile/showmarks.git'
" }}}

" call vundle#end()
" }}}


call neobundle#end()
NeoBundleCheck

" }}}
" Basic {{{
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
set foldlevelstart=20

" save view after leaving window and restore it
set viewdir=$HOME/.vim/views//
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" to make quickfix window opening on the bottom
" au FileType qf wincmd J

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
set wildignore+=*.css

set wildignore+=*Lightness/scripts/**
set wildignore+=*.vbproj

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set clipboard+=unnamed
set hlsearch
set ignorecase
set smartcase
set incsearch

set laststatus=2
" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set updatetime=400

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" }}}
" Appearance {{{

" set background=dark
set background=light
" autocmd BufEnter * colorscheme pencil
" colorscheme sonofobsidian
" colorscheme pencil
" colorscheme ir_black
" colorscheme visualstudio
colorscheme solarized
" colorscheme molokai
" colorscheme luna

set lines=50
set columns=120

if LINUX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
    set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
elseif OSX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    " set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
    set guifont=Literation\ Mono\ Powerline\ Plus\ Nerd\ File\ Types:h12

elseif WINDOWS() && has("gui_running")
    set guifont=Consolas\ for\ Powerline:h13,Andale_Mono:h10,Menlo:h10,Consolas:h9,Courier_New:h10
endif

set guioptions-=r
set guioptions-=L

" }}}
" Markdown {{{

au BufRead,BufNewFile *.md set filetype=markdown
" autocmd BufEnter *.md colorscheme pencil

" }}}
" MS SQL {{{
let g:sql_type_default = "sqlserver"
au BufNewFile,BufRead *.sql,*.SQL setlocal filetype=sqlserver
au BufNewFile,BufRead *.sql,*.SQL setlocal foldmethod=marker
au FileType sqlserver set foldmethod=marker
" autocmd BufEnter *.sql colorscheme sonofobsidian

let g:ftplugin_sql_omni_key = '<C-C>'

" }}}
" Javascript {{{
let g:javascript_enable_domhtmlcss = 1

let g:used_javascript_libs = 'underscore,angularjs,angularui,jquery,jasmine'

" }}}

" less {{{

au BufRead,BufNewFile *.less setlocal filetype=less
au BufRead,BufNewFile *.less setlocal foldmethod=indent
au FileType less set foldmethod=indent

" }}}

" TypeScript {{{

let g:js_indent_logging = 1
let g:typescript_compiler_options = '-t ES5'

" let s:system = neobundle#is_installed('vimproc') ? 'vimproc#system_bg' : 'system'
" let s:system = 'vimproc#system_bg'
let s:system = 'system'

au BufRead,BufNewFile *.ts setlocal filetype=typescript
" au BufRead,BufNewFile *.ts setlocal foldmethod=indent
" au FileType typescript setlocal foldmethod=indent

if WINDOWS()
    set rtp+=C:/Apps/typescript-tools/
else
    set rtp+=/usr/local/lib/node_modules/typescript-tools/
endif

autocmd FileType typescript call TSSkeymap()

autocmd CursorHold,CursorMoved *.ts :checktime
" autocmd BufWritePost *.ts :call {s:system}('tsc -t ES5 ' . expand('%'))
autocmd BufWritePost *.ts :silent Make
" autocmd QuickFixCmdPost [^l]* nested botright cwindow
" autocmd QuickFixCmdPost    l* nested botright lwindow
autocmd FileType typescript setlocal updatetime=50

" }}}"

" rainbow_parentheses {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" }}}

" esformatter {{{
" autocmd FileType javascript noremap <silent> <C-f> :%!esformatter<cr>
" autocmd FileType javascript noremap <leader>es :! esformatter<CR>
"
" autocmd FileType typescript noremap <silent> <C-f> :%!tsfmt<cr>
" autocmd FileType typescript noremap <leader>es :! tsfmt<CR>
"}}}

" NERDTree {{{

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=[
            \ '\.vim$', '\~$',
            \ '\.js$',
            \ '\.js\.map$',
            \ '\.css'
            \ ]
" let NERDTreeIgnore=['\.vim$', '\~$']
let NERDTreeRespectWildIgnore = 0

map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"     exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"     exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
" endfunction
"
" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', 'blue', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" source: https://github.com/scrooloose/nerdtree/issues/201#issuecomment-9954740
" }}}

" Ag {{{
" let g:AgSmartCase = 1
" let g:ag_prg="ag --vimgrep"
let g:ag_prg="ag --column --smart-case"
let g:ag_highlight=1
nmap ,ag :Ag! ""<Left>
nmap ,al :Ag! -Q ""<Left>
nmap ,af :AgFile ""<Left>
nnoremap <silent> K :Ag! -Q <cword><CR>
vnoremap <silent> K y:Ag! -Q "<C-R>""<CR>

"}}}
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
nnoremap <silent> <leader>gm :Git log --graph --all --pretty=tformat:"\%C(yellow)\%h\%Creset\%C(cyan)\%C(bold)\%d\%Creset \%C(cyan)(\%cr)\%Creset \%C(green)\%ce\%Creset \%s"'<CR>
" }}}
" Syntastic {{{
if WINDOWS()
    let g:syntastic_javascript_jshint_exec='C:\Users\kcs\AppData\Roaming\npm\jshint.cmd'
endif
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_typescript_checkers = ['tslint']
" let g:syntastic_tshint_exec='/usr/local/bin/tslint'
let g:syntastic_typescript_checkers = ['tsc']
let g:syntastic_typescript_tsc_args = "-t ES5"
let g:syntastic_html_checkers = ['jshint', 'w3']
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['coffee', 'typescript', 'html'] }
            " \ 'passive_filetypes': ['coffee', 'less', 'html'] }
" }}}
" Js BEautify {{{

" js and ts
autocmd FileType javascript,typescript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType javascript,typescript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"}}}

"CtrlP {{{

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn))|(obj|bower_components|packages|bin|node_modules|dist|mobile|mobile_packaged)$',
            \ 'file': '\v\.(exe|so|dll|zip|css|js|js\.map)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

let g:ctrlp_map = '<C-l>'
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_cmd = 'CtrlP'

" if WINDOWS()
"     let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" else
"     let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" endif

" nnoremap <silent> ,t :CtrlP<CR>
" nnoremap <silent> ,m :CtrlPMRUFiles<CR>
" nnoremap <silent> ,m :CtrlPMixed<CR>
" nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" PyMatcher for CtrlP
""if !has('python')
"    echo 'In order to use pymatcher plugin, you need +python compiled vim'
"else
"    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"endif

let g:ctrlp_lazy_update = 150
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_files = 0

" On Windows use "dir" as fallback command.
if WINDOWS()
    let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
elseif executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif
" if executable("ag")
"     set grepprg=ag\ --nogroup\ --nocolor
"     let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
" endif

""}}}

" signify {{{
" match solarized colors
" }}}
" unite {{{{

" nnoremap <C-l> :Unite buffer file file_mru<CR>
" nnoremap <C-l> :Unite buffer file file_rec/async file_mru<CR>

" make search faster
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '%s -i --nocolor --nogroup
        \  --ignore ''.DS_Store''
        \  --ignore ''.git''
        \  --ignore ''.css''
        \  --ignore ''.js''
        \  --ignore ''bower_components''
        \  --ignore ''dist''
        \  --ignore ''distTest'' 
        \  --ignore ''Lightness/mobile''
        \  --ignore ''Lightness/mobile_packaged''
        \  --ignore ''node_modules''
        \  --ignore ''packages''
        \  --''scripts''
        \  --hidden -g ""'
    let g:unite_source_grep_recursive_opt = ''
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" ignore stuff when using the following filters
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ 'tmp/',
            \ '.sass-cache',
            \ 'node_modules/',
            \ 'bower_components/',
            \ 'node_modules/',
            \ 'obj/',
            \ 'bin/',
            \ 'debug/',
            \ 'packages/',
            \ 'dist/',
            \ 'distTest/',
            \ '.git5_specs/',
            \ '.pyc',
            \ ], '\|'))


autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
    let b:SuperTabDisabled=1
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-x> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" limit matches
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'max_candidates', 20)

"}}}
" gundo {{{
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" }}}
" Tern {{{
" set omnifunc=syntaxcomplete#Complete

"}}}
" Lightline {{{
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ },
            \ 'separator': { 'left': '|', 'right': '|' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
" }}}
" Airline {{{
" let g:airline#extensions#tabline#enabled = 0
" }}}
" changesNeoBundle {{{
let g:changes_vcs_check = 1

" }}}
" Power shell plugin {{{
let g:ps1_nofold_blocks = 1
let g:ps1_nofold_sig = 1

" }}}
" matchit {{{
runtime macros/matchit.vim

"}}}
" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" }}}
" SyntaxComplete {{{
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \	setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif

"}}}

" FileTypes {{{


"}}}
" Key mappings {{{




" Command-/ to toggle comments
map <Leader>c<space> :TComment<CR>
" imap <C-/> <Esc>:TComment<CR>i
let g:tcomment#replacements_xml={}

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" Move between split windows by using the four directions H, L, I, N
" nnoremap <silent> <C-h> <C-w>h
" nnoremap <silent> <C-l> <C-w>l
" nnoremap <silent> <C-k> <C-w>k
" nnoremap <silent> <C-j> <C-w>j

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>


let g:wheel#map#up   = '<D-k>'
let g:wheel#map#down = '<D-j>'

"folding
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>


" visual shifting (builtin-repeat)
:vnoremap < <gv
:vnoremap > >gv


nmap <leader>u :GundoToggle<CR>
" }}}

" vimdiff {{{

set diffopt+=iwhite
set diffexpr=""

" }}}

" buffer close {{{

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
    finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
    let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
    if empty(a:buffer)
        let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
        let btarget = bufnr(str2nr(a:buffer))
    else
        let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
        call s:Warn('No matching buffer for '.a:buffer)
        return
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
        call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
        return
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
        call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
        return
    endif
    let wcurrent = winnr()
    for w in wnums
        execute w.'wincmd w'
        let prevbuf = bufnr('#')
        if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
            buffer #
        else
            bprevious
        endif
        if btarget == bufnr('%')
            " Numbers of listed buffers which are not the target to be deleted.
            let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
            " Listed, not target, and not displayed.
            let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
            " Take the first buffer, if any (could be more intelligent).
            let bjump = (bhidden + blisted + [-1])[0]
            if bjump > 0
                execute 'buffer '.bjump
            else
                execute 'enew'.a:bang
            endif
        endif
    endfor
    execute 'bdelete'.a:bang.' '.btarget
    execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
nnoremap <silent> <Leader>bD :Bclose!<CR>

" }}}
" Not ordered yet {{{

" mail for mutt {{{
fun! MailcompleteC(findstart, base)
    if a:findstart == 1
        let line = getline('.')
        let idx = col('.')
        while idx > 0
            let idx -= 1
            let c = line[idx]
            " break on header and previous email
            if c == ':' || c == '>'
                return idx + 2
            else
                continue
            endif
        endwhile
        return idx
    else
        if exists("g:goobookrc")
            let goobook="goobook -c " . g:goobookrc
        else
            let goobook="goobook"
        endif
        let res=system(goobook . ' query ' . shellescape(a:base))
        if v:shell_error
            return []
        else
            "return split(system(trim . '|' . fmt, res), '\n')
            return MailcompleteF(MailcompleteT(res))
        endif
    endif
endfun

fun! MailcompleteT(res)
    " next up: port this to vimscript!
    let trim="sed '/^$/d' | grep -v '(group)$' | cut -f1,2"
    return split(system(trim, a:res), '\n')
endfun

fun! MailcompleteF(contacts)
    "let fmt='awk ''BEGIN{FS="\t"}{printf "%s <%s>\n", $2, $1}'''
    let contacts=map(copy(a:contacts), "split(v:val, '\t')")
    let ret=[]
    for [email, name] in contacts
        call add(ret, printf("%s <%s>", name, email))
    endfor
    return ret
endfun


au FileType email set completefunc=MailcompleteC

" }}}
"
au FileType markdown set nu!

" Neo Complete Cache {{{

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#max_list = 8

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <TAB> <C-n>

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" neo snippet {{{
" NeoBundle key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

let g:neosnippet#enable_snipmate_compatibility = 1

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" }}}

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction   "}}}
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType typescript setlocal omnifunc=TSScompleteFunc
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType sqlserver setlocal omnifunc=sqlcomplete#CompleteSQL

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.javascript = '[^. *\t]\.\w*\|\h\w*::'

" }}}

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'sql', 'sh']

" custom key
" Open the Ag command and place the cursor into the quotes

" ,# Surround a word with #{ruby interpolation}
map <leader># ysiw#
vmap <leader># c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" <leader>) or <leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

map <leader>` ysiw`


"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" you can paste many times the same thing
vnoremap p "_dP

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

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

let g:dbext_default_profile_darkness = 'type=SQLSRV:user=sa:passwd=ieVaich0%:srvname=notasks-api.local\RIGEL:dbname=Darkness'
let g:dbext_default_profile_entrance = 'type=SQLSRV:user=sa:passwd=ieVaich0%:srvname=notasks-api.local\RIGEL:dbname=Entrance'

au FileType html,xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings

" }}}

" for pasting in insert node if it is windows
if WINDOWS()
    inoremap <C-v> <C-o>"+p
    cmap <C-v> <C-r>+
endif

"start TSS for the project
nmap <F8> :TSSstart _references.ts<CR>

fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

set foldtext=CustomFoldText()
setlocal foldtext=CustomFoldText()

