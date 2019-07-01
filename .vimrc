" vundle begin
set nocompatible " be iMproved
filetype off  "required!
set ts=4
set expandtab
set clipboard=unnamedplus

if has('win32') || has('win64')
        set rtp^=~/.vim/
        set rtp+=~/.vim/vimfiles/bundle/vundle/
        call vundle#rc('$HOME/.vim/vimfiles/bundle')
else
        " Usual quickstart instructions
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
endif

" let Vundle manage plugins
Bundle 'gmarik/vundle'
Bundle 'AutoComplPop'

" vim-scripts.org repos
Bundle 'OmniCppComplete'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'tomasr/molokai'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'grep.vim'
Bundle 'ack.vim'
Bundle 'javabrowser'
Bundle 'auto-pairs'
Bundle 'SuperTab-continued.'
Bundle "LaTeX-Suite-aka-Vim-LaTeX"

"filetype plugin indent on     " required!
let NERDTreeDirArrows=0
" vundle end

" personal setting 缩进
set cindent      " c indent
set nu           " line number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline   " cursor line

" hi cursorline ctermbg=darkred ctermfg=white
set mouse=a      " enable mouse action in normal/visual/insert mode
set hidden       " allow buffer switch without save

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" 解决鼠标粘贴问题
" if has("mouse") 
"     set mouse-=a 
" endif

" 语法高亮
syntax enable
syntax on

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=ucs-bom,utf-8
endif

"设置编码
set encoding=utf-8
set fileencodings=utf-8

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 将H映射成移动到行首, 将L映射成移动到行尾
noremap H ^
noremap L $

" 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
" set t_ti= t_te=     

" when in insert mode, press <F5> to go to paste mode
" where you can paste mass data that won't be autoindented
set pastetoggle=<F5>    

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" vim --version | grep clipboard
" sudo apt-get install vim vim-scripts vim-gtk vim-gnome
" brew install vim
" share system clipboard 
if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
endif

" 关闭方向键, 强迫自己用 hjkl
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" w 移到下一个单词 (记忆 next word)
" b 移动到单词开头 (记忆 back)
" e 移动到单词尾部
" ctrl + u 上翻半页(记忆 up)
" ctrl + d 下翻半页(记忆 down)

" colorscheme desert
" colorscheme molokai
set background=dark
colorscheme solarized

" Font for GUI
if has('gui_running')
        set guifont=Consolas:h11:cANSI
endif

" For search highlight
set hlsearch
noremap <silent> <Space> :noh<Bar>:echo<CR>
imap <C-space> <Plug>IMAP_JumpForward
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward

let mapleader=","

" For quick window navigation
"map <leader>h :wincmd h<CR>
"map <leader>j :wincmd j<CR>
"map <leader>k :wincmd k<CR>
"map <leader>l :wincmd l<CR>
"nnoremap <C-h> <C-W>h
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-l> <C-W>l
"noremap <silent> <F4> :bp<CR>
"noremap <silent> <F5> :bn<CR>
if has("gui_running") || (&term == "win32") || (&term == "pcterm")
        noremap <C-Left> :bn<CR>
        noremap <C-Right> :bp<CR>
"press Ctrl+v and then presss any key of keyborad under the insert mode, vim
"sill diaplay the signal it recesived
elseif (&term == "xterm")
        noremap <Esc>[1;5D :bp<CR>
        noremap <Esc>[1;5C :bn<CR>
elseif (&term == "xterm-256color")
        noremap <C-Left> :bn<CR>
        noremap <C-Right> :bp<CR>
else
        noremap <Esc>[D :bp<CR>
    noremap <Esc>[C :bn<CR>
endif
" Quick close all window
map <leader>qq :qall<CR>

" For quick replace
map <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/

" For omnicomplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Do not show preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" For NERDTree plugin
autocmd vimenter * NERDTree
map <leader>t :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

" For Tagbar plugin
noremap <silent> <F9> :TagbarToggle<CR>

" For TagList plugin
" filetype plugin on
noremap <silent> <F10> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1

" For BufExplorer shortcut key
noremap <silent> <F11> :BufExplorer<CR>

" For MiniBufExplorer
let g:miniBufExplorerAutoUpdate = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
noremap <leader>m :TMiniBufExplorer<CR>

" For ctags
set tags+=~/.vim/tagfiles/stl_tags
map <F12> :!ctags -R --exclude=="*/.svn" --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q .<CR> <CR>

" For CtrlP Plugin
"let g:ctrlp_working_path_mode=1
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore={
        \ 'dir': '\.git$\|\.hg$\|\.svn$\|build$\|deps$\|lib$\|release$\|debug$',
        \}

" For powerline
if !has('win32') && !has('win64')
        set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
        let g:Powerline_symbols = 'fancy'
endif

if ! has("gui_running")
        set t_Co=256
endif
if &diff
        set background=dark
        colors peaksea
endif

noremap <silent> <F7> :JavaBrowser<CR>
let JavaBrowser_Ctags_Cmd='/usr/bin/ctags'
let JavaBrowser_User_Highlight_Tag=1

let g:atp_tab_amp=1

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='xelatex'
let g:Tex_ViewRule_pdf='/Applications/Skim.app/Contents/MacOS/Skim'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf='xelatex --interaction=nonstopmode $*'
let g:miniBufExplMapWindowNavVim = 1

"侦测文件类型
filetype on

"指定文件类型
"au BufRead,BufNewFile *.py set filetype=py

"新建文件并自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
                call setline(1,"\#########################################################################")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line(".")+1, "\# Author: liuyan")
                call append(line(".")+2, "\# mail: liuyanfeier@gmail.com")
                call append(line(".")+3, "\# Created Time: ".strftime("%c"))
                call append(line(".")+4, "\#########################################################################")
                call append(line(".")+5, "\#!/bin/bash")
                call append(line(".")+6, "")
        endif
        if &filetype == 'py'
                call setline(1, "\#!/usr/bin/python")
                call append(line("."), "if __name__ == \"__main__\":")
                call append(line("."), "")
                call append(line("."), "\#########################################################################")
                call append(line("."), "\# Created Time: ".strftime("%c"))
                call append(line("."), "\# mail: liuyanfeier@gmail.com")
                call append(line("."), "\# Author: liuyan")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line("."), "\#########################################################################")
                call append(line("."), "")
                call append(line("."), "\# -*-encoding:utf-8-*-")
        endif
        if &filetype == 'cpp'
                call setline(1, "/*************************************************************************")
                call append(line("."), "    > File Name: ".expand("%"))
                call append(line(".")+1, "    > Author: liuyan")
                call append(line(".")+2, "    > Mail: liuyanfeier@gmail.com ")
                call append(line(".")+3, "    > Created Time: ".strftime("%c"))
                call append(line(".")+4, " ************************************************************************/")
                call append(line(".")+5, "")
                call append(line(".")+6, "#include<iostream>")
                call append(line(".")+7, "using namespace std;")
                call append(line(".")+8, "")
        endif
        if &filetype == 'c'
                call setline(1, "/*************************************************************************")
                call append(line("."), "    > File Name: ".expand("%"))
                call append(line(".")+1, "    > Author: liuyan")
                call append(line(".")+2, "    > Mail: liuyanfeier@gmail.com ")
                call append(line(".")+3, "    > Created Time: ".strftime("%c"))
                call append(line(".")+4, " ************************************************************************/")
                call append(line(".")+5, "")
                call append(line(".")+6, "#include<stdio.h>")
                call append(line(".")+7, "")
        endif
        "新建文件后，自动定位到文件末尾
        autocmd BufNewFile * normal G
endfunc

filetype plugin on

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

