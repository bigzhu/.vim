"setlocal foldmethod=indent
set foldmethod=indent
set foldlevel=20
map <buffer> <f1> i<!DOCTYPE html><cr><html lang="zh"><cr><body><cr></body><cr></html><Esc>kko
map <buffer> <f2> :call HtmlBeautify()<cr>
" map <buffer> <f4> :!google-chrome %<cr><cr>
filetype indent on
"set filetype=html  
setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
" 避免折叠导致的语法高亮失效
autocmd FileType vue syntax sync fromstart
"eslint
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
