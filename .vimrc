syntax on
set number
set encoding=utf-8
"set fileencodings=sjis,iso-2022-jp,euc-jp,utf-8
set tabstop=2
set autoindent
"set cindent
set shiftwidth=4
set expandtab
set hlsearch
set cursorline 

"insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"カーソル後の文字削除
inoremap <silent> <C-d> <Del>

"引用符, 括弧の設定
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <> <><Left>

"選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n

"filetype
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
filetype plugin on

" vundleを使うためのおまじない
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
" Bundle 'hotchpotch/perldoc-vim'
" Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/neosnippet'
" Bundle 'thinca/vim-quickrun'
Bundle 'surround.vim'

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Use camel case completion.
 let g:neocomplcache_enable_camel_case_completion = 1
 " Select with <TAB>
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

nmap <Leader>r <plug>(quickrun)
