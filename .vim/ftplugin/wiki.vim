"设置vim的路径为打开文件的当前路径，以使得 wiki 的
"search.py能够正常工作，否则都是在路径 ~/下
cd %:p:h
"search
map <buffer> <f1> :SearchWiki 
" 代码快捷方式
map <buffer> <f2> a{{{class="brush: "<cr><cr>}}}<Esc>kk$i
" 生成html并打开
map <buffer> <f3> :Vimwiki2HTMLBrowse<cr>
"插入图片链接
map <buffer> <f4> i{{/static/Screenshots/.png}}<Esc>hhhhhi
"all search
map <buffer> <f5> :AllSearchWiki 
" 打开/创建 Wiki 词条
map <buffer> <f6> :VimwikiGoto 

" 包为 wiki 词
" map T O<Esc>jo<Esc>k0i[[<Esc>$a]]<Esc>
map <buffer> T wbi[[<Esc>$a]]<Esc>

map <buffer> t wbi[[<Esc>ea]]<Esc>
"找 wiki 词 

if exists("*SearchWiki")
else
    function! SearchWiki(Name)
        execute "silent !search_vimwiki.py '".a:Name."'"
        execute ":redraw!"
        execute "VimwikiGoto search"
    endfunction
endif

 command! -buffer -nargs=1 SearchWiki call SearchWiki("<args>")
autocmd FileType markdown command! -buffer -nargs=1 SearchWiki call SearchWiki("<args>")
"全文查找 
if exists("*SearchWiki")
else
    function! AllSearchWiki(Name)
        execute "!search_all.py '".a:Name."'"
        execute "VimwikiGoto search"
    endfunction
endif
 command! -buffer -nargs=1 AllSearchWiki call AllSearchWiki("<args>")
