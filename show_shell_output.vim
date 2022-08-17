
highlight Pmenu ctermbg=gray 

let job = job_start('sh run_java.sh', {'close_cb': 'CloseHandler' })

func! CloseHandler(channel)
  call s:ShowOutput() 
endfunc

function! s:ShowOutput()

	" Read file content where output is written
	 let l:output = readfile("output.txt")

	" Clear all previous popup
	 call popup_clear()

  " Show output next to the cursor
	 call popup_atcursor(l:output, { 'padding': [0,1,0,1] })

endfunc


