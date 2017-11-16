setlocal foldmethod=indent
filetype indent on
setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
map <buffer> <f2> :call JsBeautify()<cr>
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
