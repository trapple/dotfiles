syntax on
"colorscheme darkblue
set number
set encoding=utf-8
set tabstop=2
set autoindent
set shiftwidth=2
set expandtab
set hlsearch
set backspace=indent,eol,start

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

" Window幅調整
nnoremap <Up> <C-w>5+ 
nnoremap <Down> <C-w>5- 
nnoremap <Left> <C-w>10>
nnoremap <Right> <C-w>10<

"カーソル後の文字削除
inoremap <silent> <C-d> <Del>

"ハイライトを解除
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

"選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n

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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'surround.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'

filetype plugin indent on
NeoBundleCheck

" neocomplcache setting
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neosnippet setting
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neocomplcache_snippets_force_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> pumvisible() ? "\<C-j>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr><CR> neosnippet#expandable() ? neosnippet#expand_impl() : pumvisible() ? neocomplcache#close_popup() : "<CR>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/dict/'

" accelerated-jk setting
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

" vim-startify setting
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

" CtrlP setting
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>P :CtrlPClearCache<CR>:CtrlP<CR><CR>
nnoremap ,pp :CtrlP<CR>
nnoremap ,p :CtrlPClearCache<CR>:CtrlP<CR><CR>
set wildignore+=*/bower_components/*,*/node_modules/*
