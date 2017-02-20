let g:nerdtree_tabs_open_on_console_startup=0
" if file not exist, create it
" 下面这个虽然可以在文件不存在时新建, 但是如果文件名有空格就会报错.
" :map gf :e <cfile><CR>

" 如果要全局用, 以下内容放到 .vimrc里
let g:md_path='/Users/bigzhu/Dropbox/blog/data/'
map <buffer> <c-f> :execute 'silent cd' md_path<cr>:SearchMD 
" map <buffer> <c-g> 0v$gf 
:nmap <f2> :GenTocGFM <cr>
:nmap <f4> :!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "%" <cr>

"找 md 
if exists("*SearchMD")
else
    function! SearchMD(Name)
        "首先要设置运行路径,避免路径不同
        "execute 'silent cd' wiki.path
        :  echom "silent !markdown_search.py '".g:md_path."' '".a:Name."'"
        execute "silent !markdown_search.py '".g:md_path."' '".a:Name."'"
        execute ":redraw!"
        execute "open search.md"
    endfunction
endif

command! -buffer -nargs=1 SearchMD call SearchMD("<args>")
