syntax on
set number
set encoding=utf-8
set tabstop=2
set autoindent
set shiftwidth=2
set expandtab
set hlsearch
set backspace=indent,eol,start
set clipboard=unnamed,autoselect

" Fキー
nmap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><CR>

" 脱カーソルキー強制ギブス
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" インサートモードのカーソル移動（emacs風）
inoremap <C-A> <C-[>^i
inoremap <C-E> <C-[><S-A>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-[>b <C-[><S-b>i
inoremap <C-[>f <C-[>l<S-w>i

" Window幅調整
nnoremap <Up> <C-w>5+ 
nnoremap <Down> <C-w>5- 
nnoremap <Left> <C-w>10>
nnoremap <Right> <C-w>10<

"カーソル後の文字削除
inoremap <silent> <C-d> <Del>

"ハイライトを解除
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

"カッコ
inoremap "" ""<c-[>i
inoremap '' ''<c-[>i



"選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n
"選択した文字列を置換
vnoremap / "zy :%s/<C-R>"/

"filetype
autocmd BufNewFile,BufRead *.cgi    set filetype=perl
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
filetype plugin on

" NeoBundle Setting 
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'petdance/vim-perl'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'surround.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'istib/vifm.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rbgrouleff/bclose.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-ref'

"NeoBundle 'c9s/perlomni.vim'

" color scheme
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
colorscheme hybrid


filetype plugin indent on
NeoBundleCheck

" -----------------------
" neocomplete setting
" -----------------------
let g:acp_enableAtStartup = 0
" 起動時に有効
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
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
"autocmd BufWritePre :NeoCompleteBufferMakeCache <buffer>
nnoremap <silent> ,bb :<C-u>NeoCompleteBufferMakeCache<CR>
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet setting
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplete#close_popup() : "<CR>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/dict/'

" -----------------------
" accelerated-jk setting
" -----------------------
let g:accelerated_jk_acceleration_table = [12,5,3,1]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" unite.vim setting
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" javascript-libraries-syntax.vim setting
let g:used_javascript_libs = 'underscore,backbone,jquery,angularjs,jasmine'

" emmet setting
let g:user_emmet_settings = {
\ 'lang': 'ja'
\ }

" -----------------------
" vim-startify setting
" -----------------------
let g:startify_custom_header = ""
let g:startify_bookmarks = [
\ '~/.vimrc',
\ ]
let g:startify_session_dir = '~/.vim/session'

" lightline.vim setting
let g:lightline = {
\ 'colorscheme': 'wombat',
\ }
set laststatus=2

" -----------------------
" CtrlP setting
" -----------------------
nnoremap <C-p> :CtrlP<CR>
nnoremap <leader>P :CtrlPClearCache<CR>:CtrlP<CR><CR>
nnoremap ,pp :CtrlP<CR>
nnoremap ,p :CtrlPClearCache<CR>:CtrlP<CR><CR>
set wildignore+=*/bower_components/*,*/node_modules/*

" -----------------------
" ctags setting
" -----------------------
nnoremap t <Nop>
nnoremap tt g<C-]>
nnoremap <silent> tj :<C-U>tag<CR>
nnoremap <silent> tk :<C-U>pop<CR>
nnoremap <silent> tl :<C-U>tags<CR>

" -----------------------
" vifm setting
" -----------------------
nnoremap ,fm :EditVifm<CR>

" -----------------------
" color
" -----------------------
highlight Search term=reverse ctermbg=27 guibg=Blue

" -----------------------
" taglist.vim setting
" -----------------------
"set tags = tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function;p:property;I:inner'
nnoremap <silent> ,l :TlistToggle<CR><C-w>w

" -----------------------
" TwitVim setting
" -----------------------
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>w
nnoremap ,tl :<C-u>ListTwitter 
nnoremap ,ts :<C-u>SearchTwitter

" -----------------------
"peco
" -----------------------
function! PecoFind(q)
  let ret = system("mdfind " . a:q . " | peco --query " . a:q)
  for filename in split(ret, "\n")
    execute "e" filename
    break
  endfor
endfunction
command! -nargs=1 Vip :call PecoFind(<f-args>)
nnoremap ,ppp :Vip 

" -----------------------
" vim-jsbeautify
" -----------------------
nnoremap ,j :call JsBeautify()<cr>

" -----------------------
" perltidy
" -----------------------
map ,pt <Esc>:%! perltidy --se<CR>

" -----------------------
" firefoxで開く
" -----------------------
nnoremap ,ff :!open -a firefox %<cr>

" -----------------------
" pathogen setting
" -----------------------
execute pathogen#infect()

" -----------------------
" bclose setting
" -----------------------
nnoremap bc :Bclose<CR>

" -----------------------
" syntastic setting
" -----------------------
let g:syntastic_scss_checkers = ['scss_lint']

" -----------------------
" ref.vim setting
" -----------------------
" Uniteでperldoc
nnoremap <silent> ,up :<C-u>Unite ref/perldoc<CR>
