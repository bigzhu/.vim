"设置vim的路径为打开文件的当前路径，以使得 wiki 的
"search.py能够正常工作，否则都是在路径 ~/下
cd %:p:h
"search 搜索前强制修改路径到 vimwiki 的 data 路径.不能放到 function
"中,会导致函数执行缓慢,出现黑屏(原因不知)
map <buffer> <c-f> :execute 'silent cd' wiki.path<cr>:SearchWiki 
" 代码快捷方式
map <buffer> <f2> a{{{class="brush: "<cr><cr>}}}<Esc>kk$i
" 生成html并打开
map <buffer> <f3> :Vimwiki2HTMLBrowse<cr>
"插入图片链接,加入class
map <buffer> <f4> i{{/static/Screenshots/.png\|\|class="img-responsive"}}<Esc>
"all search
"map <buffer> <f5> :AllSearchWiki 
" 插入时间
inoremap <buffer> <f5> create by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by bigzhu at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
" 查寄存器里里的单词
"map <buffer> <f7> :!~/git/ydcv/ydcv.py echo @0<cr>
nnoremap <Space> yiw :Dict<cr>
" 包为 wiki 词
" map T O<Esc>jo<Esc>k0i[[<Esc>$a]]<Esc>
map <buffer> T wbi[[<Esc>$a]]<Esc>

map <buffer> t wbi[[<Esc>ea]]<Esc>

if exists("*Dict")
else
    function! Dict()
        let translated = system("~/git/ydcv/ydcv.py " .  @0)
        echo translated
    endfunction
endif

command! -buffer Dict call Dict()

"找 wiki 词 
if exists("*SearchWiki")
else
    function! SearchWiki(Name)
        "首先要设置运行路径,避免路径不同
        "execute 'silent cd' wiki.path
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
