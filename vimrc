" 基本配置-----------------------------------------------------------------------------------------------------------------------
" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
"自动识别文件类型
filetype plugin indent on
"语法高亮
syntax on
"colorscheme 主题/配色
"set t_Co=256
colorscheme Tomorrow-Night
set linebreak "vim 换行时不切断单词
set hlsearch "高亮查找字符
"diff 时不要有那么多高亮颜色
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"tab 改为 4 空格
set expandtab "是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set softtabstop=4
set tabstop=4
set shiftwidth=4

"NERDTree-----------------------------------------------------------------------------------------------------------------------
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

" insert 和移动模式下显示不同光标, mac要用 iTerm2 才有用
if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" markdown--------------------------------------------------------------------------------------------------------------
let g:md_path='~/Dropbox/blog/'
map <c-f> :execute 'silent cd' md_path<cr>:SearchMD 
" 用这一行来跳转文件(search 时用)
nmap <c-g> 0v$<esc>: execute "open ".getline("'<").".md"<cr>
" 取到v 下选中的值, 再用 open 打开
vmap <c-g> <c-">ay: execute "open <c-r>a.md"<cr>
" 关了 folding
let g:vim_markdown_folding_disabled = 1

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
"VimShell---在vim里打开shell----------------------------------------------------------------------------------------------------
let g:vimshell_editor_command = '~/'
let g:vimshell_popup_command="belowright 10split"
let g:vimshell_prompt = $USER."$ "
map <f5> :VimShellCurrentDir -popup <CR>
nmap <c-s> :VimShellCurrentDir -popup <CR>
" vue--------------------------------------------------------------------------------------------
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
" autorun--------------------------------------------------------------------------------------------
" 打开 quickfix
augroup MyGroup
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

"--------------------------------------------------------------------------------------------end
