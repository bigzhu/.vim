map <buffer> <leader>d :GoDef<cr>
"插入生成代码的相关信息
map <buffer> <f2> :GoErrCheck<cr> 
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
map <buffer> <f4> :w<cr> :GoRun<cr>
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
" set foldlevelstart=20
" set foldmethod=indent
filetype plugin indent on

let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'


