" setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread       " 編集中のファイルが変更されたら自動で読み直す
set hidden         " バッファが編集中でもその他のファイルを開けるように
set showcmd        " 入力中のコマンドをステータスに表示する

set number
set cursorline            " 現在の行を強調表示
set virtualedit=onemore   " 行末の1文字先までカーソルを移動できるように
set smartindent           " インデントはスマートインデント
set showmatch             " 括弧入力時の対応する括弧を表示
set laststatus=2          " ステータスラインを常に表示
set wildmode=list:longest " コマンドラインの補完

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

set list listchars=tab:\▸\-  " 不可視文字を可視化(タブが「▸-」と表示される)
set expandtab                " Tab文字を半角スペースにする
set tabstop=2                " 行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=2             " 行頭でのTab文字の表示幅

set ignorecase               " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase                " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan                 " 検索時に最後まで行ったら最初に戻る
set hlsearch                 " 検索語をハイライト表示
set list                     " 不可視文字を表示する

nnoremap te :<C-u>tabnew<CR>:e .<CR>
nnoremap tn :<C-u>tabnext<CR>
nnoremap tp :<C-u>tabprevious<CR>
nnoremap ee :e .<CR>
inoremap <silent> jj <ESC>


if &compatible
    set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    call dein#begin(expand('~/.vim/dein'))
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neosnippet')
    call dein#add('sjl/badwolf')
    call dein#add('tpope/vim-fugitive')
    call dein#add('scrooloose/nerdtree')
    call dein#add('ConradIrwin/vim-bracketed-paste')
    call dein#add('posva/vim-vue')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('kannokanno/previm')
    call dein#add('tyru/open-browser.vim')
    call dein#add('rking/ag.vim')

    call dein#end()
    call dein#save_state()
endif

syntax on
colorscheme badwolf
highlight Normal ctermbg=none

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

if dein#check_install()
    call dein#install()
endif

autocmd FileType vue syntax sync fromstart

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
