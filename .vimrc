" vim:fdm=marker

" Basic {{{
set nocompatible
set number                      "Line numbers are good
" set relativenumber              "relative numbering
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline                  "highlight the current line
" set colorcolumn=80
set hidden
syntax on
set spell
let mapleader=","

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

"set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set foldnestmax=8
set foldenable
set foldminlines=2
"set foldlevel=20
set foldlevelstart=20

" save view after leaving window and restore it
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" au FileType javascript set foldmethod=syntax
au FileType html set foldmethod=indent

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

set updatetime=400

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" }}}
" Bundles {{{
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

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
" Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/SyntaxComplete'
" Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'chrisbra/csv.vim'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'lukaszb/vim-web-indent'
" Plugin 'vim-scripts/eclipse.vim'
" Plugin 'jtratner/vim-flavored-markdown.git'
" }}}
" Projects {{{
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
" }}}
" Other {{{
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
Plugin 'airblade/vim-gitgutter'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'mklabs/vim-issues'
" }}}

call vundle#end()
filetype plugin indent on
" }}}
" Appearance {{{

" autocmd BufEnter * colorscheme pencil
" colorscheme sonofobsidian
colorscheme pencil
set background=dark

set lines=50
set columns=120

if has("gui_gtk2")
	set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
else
	" set guifont=Consolas\ 12,Inconsolata\ 15,Monaco\ 12
	" set guifont=Inconsolata\ XL:h12,Inconsolata:h12,Monaco:h12
end
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
" NERDTree {{{
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeWinPos = "right"

" }}}
" Ag {{{
" let g:AgSmartCase = 1
let g:agprg="ag --column --smart-case"
let g:aghighlight=1
nmap ,ag :Ag! ""<Left>
nmap ,af :AgFile ""<Left>
nnoremap <silent> K :Ag! <cword><CR>

"}}}
" Fugitive }}}
set previewheight=30

" }}}

" Syntastic {{{
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_auto_loc_list = 1

" }}} 

" Js BEautify {{{

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for ranges
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"}}}

"CtrlP {{{
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(obj|bower_components|packages|bin|node_modules|dist)$',
    \ 'file': '\v\.(exe|so|dll|zip)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

""}}}
" gundo {{{
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" }}}
" Tern {{{
" set omnifunc=syntaxcomplete#Complete
" let b:ternProjectDir = '~/Documents/Projects/Darkness/Lightness/app'
"}}}
" FileTypes {{{


"}}}
" Key mappings {{{


nmap <D-N> :NERDTreeToggle<CR>


" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

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
inoremap <expr><C-e>  neocomplete#cancel_popup()

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

" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>

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


" }}}
