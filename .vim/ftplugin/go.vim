map <buffer> <leader>d :GoDef<cr>
map <buffer> <f4> :w<cr> :GoRun<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
