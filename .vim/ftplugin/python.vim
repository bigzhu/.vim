
cd %:p:h

let g:pymode_lint_ignore = "E501,W0403,C0110,C0301,W0703,R0201,E265"
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 0
"关了自动补全,太慢了.
let g:pymode_rope_completion=0
"let g:pymode_rope_complete_on_dot = 0
"不要找,太慢了
"let g:pymode_rope_lookup_project = 0
let g:pymode_options_max_line_length = 279
"跳转定义的时候,用 e new vnew tabnew 哪种方式打开
let g:pymode_rope_goto_definition_cmd = 'tabnew'

let g:pymode_indent = 1
map <buffer> <f1> i#!/usr/bin/env python<cr># -*- coding: utf-8 -*-<cr><cr>if __name__ == '__main__':<cr>pass<Esc>
"map <buffer> <f2> :Pylint<cr>
"用autopep8来自动格式化python
map <buffer> <f2> :!autopep8 --max-line-length 444 --in-place --aggressive --aggressive % <cr><cr>:edit<cr>
"map <buffer> <f3> :w<cr>:!python %  test <cr>
map <buffer> <f4> :w<cr> :cd %:p:h<cr> :!python %<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
"python 语法检查
"highlight SpellBad term=underline gui=undercurl guisp=Orange

