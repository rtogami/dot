set encoding=utf8
set fileencodings=utf8,iso-2022-jp,cp932,euc-jp
set number
set ruler
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set title
set listchars=trail:_,extends:>,precedes:<
set cursorline
set nobackup
set nosmartindent
set whichwrap=b,s,h,l,<,>,[,]
set formatoptions=lmoq
set showcmd
set showmode
set backspace=indent,eol,start
set hlsearch
set backupskip=/tmp/*,/private/tmp/*
set splitright

""" Key bind
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
noremap <CR> o<ESC>
map <LEFT> <ESC>:bp!<CR>
map <RIGHT> <ESC>:bn!<CR>


""" HighLight ZenkakuSpace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"""Python Support
let g:python3_host_prog = expand('$HOME') . '/.anyenv/envs/pyenv/shims/python'

""" dein.vim
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

""" filetype
filetype plugin indent on
" filetype indent on

""" Color
set encoding=utf-8
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
set background=dark
colorscheme solarized

""" Use deoplete.
let g:deoplete#enable_at_startup = 1

""" StatusLine
set laststatus=2                       " 常にステータスラインを表示
set ruler                              " カーソルが何行目の何列目に置かれているかを表示する
let g:Powerline_symbols = 'compatible'


""" indentLine
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0
" 奇数インデントのガイドカラー
hi IndentGuidesOdd  ctermbg=green
" 偶数インデントのガイドカラー
hi IndentGuidesEven ctermbg=green
" ガイドの幅
let g:indent_guides_guide_size = 1


""" unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,r :<C-u>Unite file_mru<CR>
nnoremap <silent> ,g :<C-u>Unite git_modified<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

""" jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1 
