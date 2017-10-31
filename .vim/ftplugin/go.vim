map <buffer> <f2> :!autopep8 --max-line-length 444 --in-place --aggressive --aggressive % <cr><cr>:edit<cr>
map <buffer> <f3> :w<cr>:PymodeLint <cr>
map <buffer> <f4> :w<cr> :GoRun<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
"python 语法检查
"highlight SpellBad term=underline gui=undercurl guisp=Orange

