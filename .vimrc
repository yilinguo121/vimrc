""set encoding=utf-8
""set fileencodings=utf-8
""set termencoding=utf-8


call plug#begin()

" List your plugins here
Plug 'ghifarit53/tokyonight-vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/taglist.vim'
Plug 'wesleyche/SrcExpl'
Plug 'wesleyche/Trinity'
Plug 'majutsushi/tagbar'
call plug#end()

autocmd BufNewFile *.cpp 0r ~/cpp_template.cpp

" 顯示空白字符
set list

" 設定顯示空白字符的樣式
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" 高亮顯示多餘的空白字符
highlight ExtraWhitespace ctermfg=red guifg=red

" 使用 match 命令匹配多餘的空白字符
match ExtraWhitespace /\s\+$/

" 自動命令，在打開緩衝區時匹配多餘的空白字符
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" 顏色
colorscheme tokyonight
set t_Co=256
set background=dark
set foldmethod=syntax

filetype plugin indent on
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

syntax on
" set paste
set showmode
set showcmd
" 開啟行號顯示
set nu!
" 自動縮排
set autoindent
set cindent
" Tab鍵的寬度
set tabstop=4
" 統一縮排爲4
set softtabstop=4
set shiftwidth=4
"去掉錯誤音
set vb t_vb=
au GuiEnter * set t_vb=
" 選中狀態下 Ctrl+c 複製
vmap <C-c> y
" 對映全選+複製 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
"共用剪貼簿
set clipboard=unnamed
"解決插入模式下刪除失效問題
set backspace=2
autocmd vimEnter *.cpp map <F5> :w <CR> :!clear ; g++ --std=c++17 %  && echo Compiled successfully. && time ./a.out; <CR>

hi Normal ctermfg=252 ctermbg=none

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

nnoremap <C-p> <C-]>
set incsearch
set hlsearch
