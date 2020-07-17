"""""""""""""
   "Quickly Run
""""""""""""""
func! CompileRunGcc()
    exec "w"
 if &filetype == 'c'
     exec "!g++ % -o %<"
 elseif &filetype == 'cpp'
     exec "!g++ % -o %<"
 elseif &filetype == 'java'
     exec "! javac %"
 elseif &filetype == 'sh'
     :!time bash %
 elseif &filetype == 'python'
     exec "!time python2.7 %"
 endif 
 endfunc

"""""""""""""
"Debug
""""""""""""
function! Debug()
python << EOF
import vim
import re
cur_buf = vim.current.buffer
row,col = vim.current.window.cursor
print row
space = re.search("^ {0,100}",cur_buf[row-1]).span()
cur_buf.append(" "*space[1]+"pdb.set_trace()",row-1)
EOF
endfunction

command -nargs=0 Run   call CompileRunGcc()
command -nargs=0 Debug call Debug()
