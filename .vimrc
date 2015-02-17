"--------------------------------------------------------------------------------------------------------------------------------------------------------------
"VIM-----------------------------------------------------------------------------------------------------------------------------------------------------------
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
set nocompatible
"自动识别文件类型
filetype on
"自动缩进
"set autoindent
set smartindent
"让backspace可以删除indent
"set backspace=indent,eol,start
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
"set fencs=utf-8,gb2312,ucs-bom,gb18030,gbk,gb2312,cp936
set fencs=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
"colorscheme 主题/配色
set t_Co=256
colorscheme Tomorrow-Night
"set background=dark
"colorscheme solarized


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
"--------------------------------------------------------------------------------------------------------------------------------------------------------------
"VIMWIKI-------------------------------------------------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.wiki set filetype=wiki
"vimwiki 配置文件
let wiki = {}
"保存时是否自动生成html
let wiki.auto_export=1
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
" 是否在计算字串长度时用特别考虑中文字符
let wiki.vimwiki_CJK_length=1
let wiki.index='index'
"let wiki.syntax='markdown'
"使用markdown语法
let wiki.path='~/Dropbox/knowledge/data/'
let wiki.path_html='~/Dropbox/knowledge/html/'
let wiki.template_path='./'
let wiki.template_default='def_template'
let wiki.template_ext='.html'
let wiki.index='wiki_index'

let wiki.nested_syntaxes={'python': 'python', 'c++': 'cpp', 'bash': 'sh', 'as3': 'actionscript', 'mxml': 'mxml', 'sql': 'sql', 'html': 'html', 'java': 'java', 'xml': 'xml', 'js': 'javascript', 'coffee':'javascript', 'less':'less', 'css':'css'}
"search.py能够正常工作，否则都是在路径 ~/下
autocmd BufNewFile,BufRead *.wiki cd %:p:h

"let g:vimwiki_list=[wiki,wiki2]
let g:vimwiki_list=[wiki]
"不需要驼峰英文成为维基词条
let g:vimwiki_camel_case=0
let g:vimwiki_file_exts='py,pdf,txt,doc,rtf,xls,php,zip,rar,7z,html,gz'
let g:vimwiki_browsers=['google-chrome']

"HTML--------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.html set filetype=html

"backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/temp
"set dir=~/tmp
"光标,mac要用 iTerm2 才有用
if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"tree
"shift+i 显示隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1
"autocmd VimEnter * NERDTree
"tab \n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"让tree打开在tab
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
"vim和系统共用剪切板
let g:copycat#auto_sync = 1
"同个文件,只激活tab
"set switchbuf=usetab

"mac
"set clipboard=unnamed

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

"open bash
map <C-A-c> :ConqueTerm
map <C-A-v> :ConqueTermTab
map <f10> :ConqueTermTab bash<cr>
"nerdtree
let NERDTreeIgnore = ['\.pyc$','nohup.out']
