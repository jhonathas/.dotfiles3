let g:VM_no_meta_mappings=1
let g:VM_sublime_mappings=1

let g:VM_maps = {}

let g:VM_maps["Add Cursor Down"] = ''      " start selecting down
let g:VM_maps["Add Cursor Up"]   = ''        " start selecting up

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists('g:deoplete#disable_auto_complete')
	   let g:deoplete#disable_auto_complete = 1
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists('g:deoplete#disable_auto_complete')
	   let g:deoplete#disable_auto_complete = 0
    endif
endfunction
