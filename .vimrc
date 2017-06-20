"--------------------------------------------------------------------------------------------------------------------------------------------------------------
"VIM-----------------------------------------------------------------------------------------------------------------------------------------------------------
"vim和系统共用剪切板
let g:copycat#auto_sync = 1
"用文件类型plugin脚本
filetype plugin on
"自动 read 变化
set autoread
"光标放一段时间,插件文件是否变化
autocmd CursorHold * checktime
"刚进入 tab 检查是否发生变化
autocmd TabEnter * checktime
"--------------------------------------------------------------------------------------------------------------------------------------------------------------
"必须在增强模式下(vimwiki要求),所以首先确保关闭了 “compatible” 选项
"set nocompatible
"自动识别文件类型
filetype on
"自动缩进
" set smartindent
"让backspace可以删除indent
set backspace=indent,eol,start
"tab 改为 4 空格
set expandtab "是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set softtabstop=4
set tabstop=4
set shiftwidth=4
"vim 换行时不切断单词
set linebreak
"语法高亮
syntax on
" 设置文件编码检测类型及支持格式
set fencs=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
"colorscheme 主题/配色
set t_Co=256
colorscheme Tomorrow-Night
set guioptions-=m " 关闭菜单栏
set guioptions-=T " 关闭工具栏
set guioptions-=l " 关闭左边滚动条
set guioptions-=L " 关闭垂直分隔窗口左边滚动条
set guioptions-=r " 关闭右边滚动条
set guioptions-=R " 关闭垂直分隔窗口右边滚动条
set hlsearch "高亮查找字符

"用来在多行加入复制到寄存器的的操作  qa 进入复制 q 结束复制
"将重复使用寄存器a中的命令映射到 `
nnoremap ` @a
"让 ` 在 visual 模式下可用
vnoremap ` :normal @a
"pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

autocmd BufNewFile,BufRead *.html set filetype=html
autocmd BufNewFile,BufRead *.wxml set filetype=html

"光标,mac要用 iTerm2 才有用
if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
 \ if ! exists("g:leave_my_cursor_position_alone") |
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif |
 \ endif


"支持vue高亮
autocmd BufNewFile,BufRead *.vue set filetype=vue
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"改用syntastic来做python lint
let g:pymode_lint_write = 0
let g:syntastic_python_flake8_args='--ignore=E501'
"let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"call Dash from vim
map <c-d> :Dash 
"NERDTree-----------------------------------------------------------------------------
"shift+i 显示隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1
"默认打开时，光标总是落在内容上
let g:nerdtree_tabs_smart_startup_focus = 2
"autocmd VimEnter * NERDTree
"tab \n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"让tree打开在tab
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
let NERDTreeIgnore = ['\.pyc$','nohup.out', 'node_modules']
"打开文件时改变path
autocmd BufEnter * lcd %:p:h

"同个文件,只激活tab
"set switchbuf=usetab

"mac
"set clipboard=unnamed
"VimShell-------------------------------------------------------------------------------------------------------
let g:vimshell_editor_command = '~/'
let g:vimshell_popup_command="belowright 10split"
let g:vimshell_prompt = $USER."$ "
map <f5> :VimShellCurrentDir -popup <CR>
nmap <c-s> :VimShellCurrentDir -popup <CR>

"把 - 连接的当做一个单词
set iskeyword+=-
"show file name in bottom
set statusline+=%F
set laststatus=2
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" markdown--------------------------------------------------------------------------------------------------------------
let g:md_path='/Users/bigzhu/Dropbox/blog/'
map <c-f> :execute 'silent cd' md_path<cr>:SearchMD 
" 取到v 下选中的值, 再用 open 打开
map <c-g> 0v$<esc>: execute "open ".getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]<cr>

"找 md 
if exists("*SearchMD")
else
    function! SearchMD(Name)
        "首先要设置运行路径,避免路径不同
        ":  echom "silent !markdown_search.py '".g:md_path."' '".a:Name."'"
        execute "silent !markdown_search.py '".g:md_path."' '".a:Name."'"
        execute ":redraw!"
        execute "open search.md"
    endfunction
endif

command! -nargs=1 SearchMD call SearchMD("<args>")
"set tags=./tags,../tags,../../tags,../../../tags
set tags=/Users/bigzhu/gts_sale/tags
" Persistent Undo in Vim
set undofile " Maintain undo history between sessions
set undodir=~/.vim_undo
