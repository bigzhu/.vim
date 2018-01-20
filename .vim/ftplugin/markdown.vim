let g:nerdtree_tabs_open_on_console_startup=0
" if file not exist, create it
" 下面这个虽然可以在文件不存在时新建, 但是如果文件名有空格就会报错.
" :map gf :e <cfile><CR>

" map <buffer> <c-g> 0v$gf 
:nmap <f2> :GenTocGFM <cr>
:nmap <f4> :!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "%" <cr>
" 插入当前时间
:inoremap <buffer> <c-n> <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
":nmap <c-m> :TableAddFormula<cr>Sum(1:-1)<cr>

" for vim-table-mode
let g:table_mode_corner='|'
let g:table_mode_border=0
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


map <buffer> <f1> idraft: true<cr>date: <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><cr>cover: /images/avatar.jpeg<cr>tags:<cr>    - bigzhu<cr><BS><BS><BS>preview:<cr><cr>---<cr><!--more--><cr><Esc>
