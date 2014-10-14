" vim:fdm=marker

set nocompatible

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
" }}}
" Basic {{{
set number                      "Line numbers are good
" set relativenumber              "relative numbering
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line
" set colorcolumn=80
set hidden
syntax on
set spell
let mapleader=","
scriptencoding utf-8
set encoding=utf-8

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

" au FileType javascript set foldmethod=syntax
au FileType javascript set foldmethod=indent
au FileType html set foldmethod=indent
au FileType xml,xhtml set foldmethod=indent

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
" set statusline=%<%f\                     " Filename
" set statusline+=%w%h%m%r                 " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
" set statusline+=\ [%{&ff}/%Y]            " Filetype
" set statusline+=\ [%{getcwd()}]          " Current dir
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set updatetime=400

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" }}}
" Bundles {{{
filetype off
if WINDOWS()
    set rtp+=~/.vim/bundle/Vundle.vim/
    let path='~/.vim/bundle'
    call vundle#begin(path)
elseif OSX() || LINUX()
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif


Plugin 'gmarik/Vundle.vim'

" colorscheme {{{
Plugin 'sickill/vim-monokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'therubymug/vim-pyte'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'endel/vim-github-colorscheme'
Plugin 'chrishunt/color-schemes'
Plugin 'baeuml/summerfruit256.vim'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'
Plugin 'moll/vim-bbye'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'reedes/vim-colors-pencil'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'vim-scripts/Son-of-Obisidian'
Plugin 'vim-scripts/Visual-Studio'

" }}}
" Snippet {{{
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'eesdil/bootstrap-snippets'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Plugin 'SirVer/ultisnips'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate.git'
" }}}
" Languages {{{
Plugin 'groenewege/vim-less.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic.git'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-markdown'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'hoffstein/vim-tsql'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-scripts/sqlserver.vim'
" Plugin 'vim-scripts/SQLUtilities'
" Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/sql.snippets'
" Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'chrisbra/csv.vim'
"Plugin 'othree/html5.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'vim-scripts/visual_studio.vim'
Plugin 'tsaleh/vim-align'
Plugin 'PProvost/vim-ps1'

" Plugin 'vim-scripts/JavaScript-Indent'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'lukaszb/vim-web-indent'
" Plugin 'vim-scripts/eclipse.vim'
" Plugin 'jtratner/vim-flavored-markdown.git'
" }}}
" Projects {{{
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
"Plugin 'editorconfig/editorconfig-vim'
" }}}
" Other {{{
Plugin 'vim-scripts/closetag.vim'
Plugin 'tpope/vim-ragtag'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'airblade/vim-rooter'
Plugin 'tommcdo/vim-exchange'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'reedes/vim-wheel'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'xsunsmile/showmarks.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/YankRing.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'vim-scripts/AutoTag.git'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'skwp/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'tpope/vim-repeat'
Plugin 'amiorin/vim-fenced-code-blocks'
Plugin 'chrisbra/NrrwRgn'
Plugin 'godlygeek/tabular'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'chrisbra/changesPlugin'
Plugin 'spf13/vim-autoclose'
Plugin 'majutsushi/tagbar'
Plugin 'bronson/vim-visual-star-search'
Plugin 'vim-scripts/DirDiff.vim'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'mklabs/vim-issues'
" }}}

call vundle#end()
filetype plugin indent on
" }}}
" Appearance {{{

" set background=dark
set background=light
" autocmd BufEnter * colorscheme pencil
" colorscheme sonofobsidian
" colorscheme pencil
" colorscheme ir_black
colorscheme visualstudio

set lines=50
set columns=120

if LINUX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
	set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
elseif OSX() && has("gui_running")
    "set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
	set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
elseif WINDOWS() && has("gui_running")
    set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
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
au BufNewFile,BufRead *.sql setlocal filetype=sqlserver
au BufNewFile,BufRead *.sql setlocal foldmethod=marker
au FileType sqlserver set foldmethod=marker
" autocmd BufEnter *.sql colorscheme sonofobsidian

" }}}
" Javascript {{{
let g:javascript_enable_domhtmlcss = 1

" }}}

" esformatter {{{
nnoremap <silent> <C-f> :%!esformatter<cr>
vnoremap <silent> <leader>es :! esformatter<CR>

"}}}

" NERDTree {{{

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeWinPos = "right"
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" }}}
" Ag {{{
" let g:AgSmartCase = 1
let g:agprg="ag --column --smart-case"
let g:aghighlight=1
nmap ,ag :Ag! ""<Left>
nmap ,af :AgFile ""<Left>
nnoremap <silent> K :Ag! <cword><CR>

"}}}
" Fugitive {{{
set previewheight=30
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
let g:syntastic_html_checkers = ['jshint', 'w3']
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['coffee'] }
" }}}
" Js BEautify {{{

"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for ranges
" autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"}}}
"CtrlP {{{
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(obj|bower_components|packages|bin|node_modules|dist)$',
    \ 'file': '\v\.(exe|so|dll|zip)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

let g:ctrlp_map = '<c-\>'
let g:ctrlp_cmd = 'CtrlPMixed'

" nnoremap <silent> ,t :CtrlP<CR>
" nnoremap <silent> ,m :CtrlPMRUFiles<CR>
" nnoremap <silent> ,m :CtrlPMixed<CR>
" nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" PyMatcher for CtrlP
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

let g:ctrlp_lazy_update = 150
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
" if executable("ag")
"     set grepprg=ag\ --nogroup\ --nocolor
"     let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
" endif

""}}}
" gundo {{{
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" }}}
" Tern {{{
set omnifunc=syntaxcomplete#Complete

"}}}
" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filepath', 'filename', 'modified' ] ]
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
" changesPlugin {{{
let g:changes_vcs_check = 1

" }}}
" Power shell plugin {{{
let g:ps1_nofold_blocks = 1
let g:ps1_nofold_sig = 1

" }}}
" matchit {{{
runtime macros/matchit.vim

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
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

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


nmap ,u :GundoToggle<CR>
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
let g:neocomplete#sources#syntax#min_keyword_length = 3
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
" Plugin key-mappings.
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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" }}}

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'sql', 'sh']

" custom key
" Open the Ag command and place the cursor into the quotes

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`


"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

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
nmap ,w :StripTrailingWhitespaces<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" split right below {{{
set splitbelow
set splitright
" }}}

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

let g:dbext_default_profile_darkness = 'type=SQLSRV:user=sa:passwd=ieVaich0%:srvname=.\RIGEL:dbname=Darkness'
let g:dbext_default_profile_entrance = 'type=SQLSRV:user=sa:passwd=ieVaich0%:srvname=.\RIGEL:dbname=Darkness'


au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }}}

" for pasting in insert node if it is windows
if WINDOWS()
    inoremap <C-v> <C-o>"+p
    cmap <C-v> <C-r>+
endif

