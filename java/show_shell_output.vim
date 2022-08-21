
nmap <f5> :call ExecuteJob()<cr>

highlight Pmenu ctermbg=white 

let script_dir = expand('<sfile>:p:h')

func! ExecuteJob()
 let l:editingFile = expand('%:p') 
 let l:command = 'sh ' . g:script_dir . '/run_java.sh ' . l:editingFile
 let l:job = job_start(l:command, {'close_cb': 'CloseHandler' })
endfunc

func! CloseHandler(channel)
 call s:ShowOutput() 
endfunc
 
function! s:ShowOutput()
 " Read file content where output is written
 let l:output = readfile(g:script_dir . "/output.txt")
 
 " Clear all previous popup
 call popup_clear()
  
 " Show output next to the cursor
 call popup_atcursor(l:output, { 'padding': [0,1,0,1], 'moved': 'any'  })
endfunc

