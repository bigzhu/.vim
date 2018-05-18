" 对go 默认打开右边函数列
"TagbarOpen
"允许覆盖默认映射
let g:go_def_mapping_enabled = 0
" GoReferrers 时, 下方显示的内容
let g:go_list_height = 6
" 跳转到定义时, 打开新 tab
au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap gr <Plug>(go-referrers)
" 跳转到定义时 激活已打开的 tab
let g:go_def_reuse_buffer = 1

" 自动插入struct tag
map <buffer> <f2> ::GoAddTags 
" 生成测试结构
map <buffer> <f3> :GoTests<cr>
" 对这个函数测试
map <buffer> <f4> :GoTestFunc<cr>
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
" 自动插入对 err 处理
inoremap <buffer> <C-e> if err != nil {<cr>return<cr>}<cr><esc> 

" 对这个函数测试
filetype plugin indent on

" 保存时执行检查
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['errcheck', 'golint']
"let g:go_metalinter_autosave_enabled = ['golint']
" 保存时检查后不要出现等待 press
let g:go_echo_command_info=0

let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:go_list_type = "quickfix"
let g:go_list_type = "locationlist"

" Enable heavy omni completion.
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'

" 自动折叠
set foldmethod=syntax
"set foldnestmax=1  
set foldlevel=20
set foldlevelstart=20
"quickfix里都选择打开newtab
set switchbuf=newtab

" 增加性能: https://github.com/fatih/vim-go/issues/145
set nocursorcolumn
syntax sync minlines=256
set re=1

" ctrl + l 显示代码提示, ctrl + o 和 iterm 冲突了
inoremap <buffer> <C-l> <C-x><C-o>
