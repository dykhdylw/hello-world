set encoding=utf-8
let g:vimproc#download_windows_dll = 1

" :source $VIMRUNTIME/mswin.vim

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " NeoBundle 設定
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: neobundle の設定を.gvimrcに書かないこと！

 " ここに追加したいプラグインを追加します。
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'https://github.com/Shougo/vimshell.git'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'

" NeoBundle-Plugin: colorschemes
NeoBundle 'morhetz/gruvbox'
NeoBundle 'kristijanhusak/vim-hybrid-material'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'mhartington/oceanic-next'
NeoBundle 'aereal/vim-colors-japanesque'
NeoBundle 'raphamorim/lucario'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'rakr/vim-two-firewatch'
NeoBundle 'mkarmona/materialbox'
NeoBundle 'cdmedia/itg_flat_vim'

call neobundle#end()

" Required:
filetype plugin indent on
filetype indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 常にステータスラインを表示
set laststatus=2
set showtabline=2
set noshowmode
" 256色対応？
set t_Co=256
" 行番号
set number
" 現在行をハイライト
set cursorline

" Markdown設定
au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Firefox'

"     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"     \ 'colorscheme': 'jellybeans',
let g:lightline = {
     \ 'colorscheme': 'gotham256',
     \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
     \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
     \ }
" let g:lightline.colorscheme = 'hybrid'

" Vimfiler設定
" let g:vimfiler_as_default_explorer = 1
" noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
" noremap <C-X><C-T> :VimFiler -split -simple -wi" nwidth=45 -no-quit<ENTER>

" NERDTree設定
let g:NERDTreeShowBookmarks=1
" autocmd vimenter * NERDTree|normal gg3j

" CtrlP設定
" デフォルトのマッピングを無効化(default:'<C-p>')
let g:ctrlp_map = '<Nop>'
" 対象ファイル最大数(default:10000)
let g:ctrlp_max_files  = 100000
" 検索対象の最大階層数(default:40)
let g:ctrlp_max_depth = 10
" vim終了時にキャッシュクリアしない(default:1)
let g:ctrlp_clear_cache_on_exit = 0
" 検索ウィンドウの設定
" :help g:ctrlp_match_window
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
" カレントディレクトリを基準に検索
nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
" カレントバッファのルートディレクトリを基準に検索(root:自動認識)
nnoremap <silent> <Space>cF :CtrlPRoot<CR>
" 最近使ったファイルから検索
nnoremap <silent> <Space>cr :CtrlPMRUFiles<CR>

" キーマッピング
map gh ^
map gl $
map tt ^v$h
nnoremap <silent> <Space>t :tabnew<CR>

" tab幅(スペース4つ)
set tabstop=4
set expandtab

" 折り返し行もインデント
set breakindent

" 不可視文字を表示
set list
set listchars=tab:￫\ ,trail:.

" カーソル行移動時のスクロール開始余白
set scrolloff=8

" Vim起動時に前回のセッションを復元する
" source ~/.vim/vimfiles/.session

" Vim終了時に現在のセッションを保存する
au VimLeave * mks! ~/.vim/vimfiles/.session

set backupdir=C:/Users/panasonic/.vim/vimfiles/tmp
set undodir=C:/Users/panasonic/.vim/vimfiles/tmp
set directory=~/.vim/vimfiles/tmp
