setlocal foldmethod=indent
setlocal foldlevel=20
filetype indent on
setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
map <buffer> <f2> :call JsBeautify()<cr>
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
"把 - 横线连接的当做一个单词
set iskeyword+=-
