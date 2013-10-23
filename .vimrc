syntax on
set number
set encoding=utf-8
set tabstop=2
set autoindent
set shiftwidth=2
set expandtab
set hlsearch
set backspace=indent,eol,start

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
NeoBundle 'surround.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rhysd/accelerated-jk'

filetype plugin indent on
NeoBundleCheck

" neocomplcache setting
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_smart_case = 1
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neosnippet setting
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neocomplcache_snippets_force_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/dict/'

" accelerated-jk setting
let g:accelerated_jk_acceleration_table = [12,5,3,1]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
