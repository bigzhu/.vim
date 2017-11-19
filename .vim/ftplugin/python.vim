
cd %:p:h
let g:ale_python_flake8_options = "--ignor='E501,E265'"
set foldmethod=indent

map <buffer> <f1> i#!/usr/bin/env python<cr># -*- coding: utf-8 -*-<cr><cr>if __name__ == '__main__':<cr>import doctest<cr>doctest.testmod(verbose=False, optionflags=doctest.ELLIPSIS)<Esc>
"map <buffer> <f2> :Pylint<cr>
"用yapf来自动格式化python
map <buffer> <f2> :0,$!yapf --style='{COLUMN_LIMIT=10000}'<CR>
" 整理 import
map <buffer> <f3> :!isort %<CR><CR>
map <buffer> <f4> :AsyncRun! python %<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
