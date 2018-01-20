map <buffer> <leader>d :GoDef<cr>

nmap <buffer> gr :GoReferrers<cr>

"插入生成代码的相关信息
map <buffer> <f2> :GoErrCheck<cr> 
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
map <buffer> <f4> :w<cr> :GoRun<cr>
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
" set foldlevelstart=20
" set foldmethod=indent
filetype plugin indent on

let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck']

let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'

" 自动折叠
set foldmethod=syntax
set foldnestmax=1  
set foldlevel=20
set foldlevelstart=20

" GoReferrers 时, 下方显示的内容
let g:go_list_height = 6
