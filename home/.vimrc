syntax on
set number
set encoding=utf-8
set shiftwidth=2
set hlsearch
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set scrolloff=5

" ビープ音の停止
set visualbell t_vb=
set noerrorbells

" スワップファイルの出力先
set directory=~/.vim/tmp/

" バックアップファイルの出力先
set backupdir=~/.vim/tmp/

" カーソル
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

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

" jj/kkでインサートモードを抜ける
inoremap jj <C-[>


" Window幅調整
nnoremap <Up> <C-w>5+ 
nnoremap <Down> <C-w>5- 
nnoremap <Left> <C-w>10>
nnoremap <Right> <C-w>10<

"カーソル後の文字削除
inoremap <C-d> <Del>

"ハイライトを解除
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

"カッコ
inoremap "" ""<Left>
inoremap '' ''<Left>

"選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n
"選択した文字列を置換
vnoremap / "zy :%s/<C-R>"/

"filetype
autocmd BufNewFile,BufRead *.cgi    set filetype=perl
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead *.ep     set filetype=html
autocmd BufNewFile,BufRead *.tx     set filetype=html
autocmd BufNewFile,BufRead *.twig   set filetype=html
autocmd BufNewFile,BufRead *.md     set filetype=markdown
autocmd BufNewFile,BufRead *.jsx    set filetype=javascript
filetype plugin on

" NeoBundle Setting 
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
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
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rbgrouleff/bclose.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mbbill/undotree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'moll/vim-node'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vifm/vifm.vim'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'yuuki1/perl-local-lib-path.vim'
NeoBundle 'LeafCage/yankround.vim'

"NeoBundle 'c9s/perlomni.vim'

" color scheme
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
colorscheme desert

call neobundle#end()
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
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'javascript': $HOME.'/.vim/dict/javascript.dict',
    \ 'php': $HOME.'/.vim/dict/phpunit.dict'
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
let g:neosnippet#snippets_directory='~/.vim/dict/'

" -----------------------
" accelerated-jk setting
" -----------------------
let g:accelerated_jk_acceleration_table = [3,5,7,12,17,21,24,26,28,30]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nmap l <Plug>(accelerated_jk_l)
nmap h <Plug>(accelerated_jk_h)
nnoremap <silent><Plug>(accelerated_jk_l) :<C-u>call accelerated#time_driven#command('l')<CR>
nnoremap <silent><Plug>(accelerated_jk_h) :<C-u>call accelerated#time_driven#command('h')<CR>

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
let g:used_javascript_libs = 'react,underscore,backbone,jquery,angularjs,jasmine,flux'

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
nnoremap <silent> ,j :call JsBeautify()<cr>

" -----------------------
" vim-esformatter
" -----------------------
autocmd FileType javascript nnoremap <silent> ,f :Esformatter<CR>
autocmd FileType javascript vnoremap <silent> ,f :EsformatterVisual<CR>

" -----------------------
" perltidy
" -----------------------
autocmd FileType perl map <silent> ,f :<C-u>%! perltidy --se<CR>

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
" https://github.com/scrooloose/syntastic
" -----------------------
let g:syntastic_check_on_open = 1
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_mode_map = { 
\ "mode": "active",
\ "active_filetypes": ["php", "javascript", "json", "perl"],
\ "passive_filetypes": ["html"]
\}
let g:syntastic_enable_perl_checker = 1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_perl_lib_path = ['lib', 'local/lib/perl5']

" -----------------------
" ref.vim setting
" -----------------------
" Uniteでperldoc
nnoremap <silent> ,up :<C-u>Unite ref/perldoc<CR>

" -----------------------
" Quickrun setting
" -----------------------
let g:quickrun_config = {
\   '_' : {
\     'outputter/buffer/split': 'vertical botright',
\     'runner': 'vimproc',
\     'runner/vimproc/updatetime': 40,
\   },
\   'carton' : {
\     'cmdopt': '-Ilib',
\     'exec': 'carton exec -- perl %o %s'
\   },
\   'markdown': {
\     'type'     : 'markdown',
\     'outputter': 'null',
\     'command'  : 'open',
\     'cmdopt'   : '-a',
\     'args'     : 'Marked\ 2',
\     'exec'     : '%c %o %a %s',
\   }
\ }
autocmd FileType perl nnoremap <silent> ,r :QuickRun carton<CR>

" -----------------------
" CamelCaseMotion setting
" https://github.com/bkad/CamelCaseMotion
" -----------------------
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e

" -----------------------
" vim-jsx setting
" https://github.com/mxw/vim-jsx 
" -----------------------
"let g:jsx_ext_required = 0

" -----------------------
" vifm setting
" https://github.com/vifm/vifm.vim
" -----------------------
nnoremap <silent> ,fm :EditVifm<CR>

" -----------------------
" vim-ansible-yaml setting
" https://github.com/chase/vim-ansible-yaml
" -----------------------
let g:ansible_options = {'ignore_blank_lines': 0}

" -----------------------
" clang-format setting
" https://github.com/rhysd/vim-clang-format
" -----------------------
let g:clang_format#style_options = {}
autocmd FileType c nnoremap ,f :<C-u>ClangFormat<CR>
autocmd FileType c vnoremap ,f :ClangFormat<CR>

" -----------------------
" perl-local-lib-path
" https://github.com/yuuki1/perl-local-lib-path.vim
" -----------------------
let g:perl_local_lib_path = "lib"
autocmd FileType perl PerlLocalLibPath

" -----------------------
" yankround.vim
" https://github.com/LeafCage/yankround.vim
" -----------------------
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
