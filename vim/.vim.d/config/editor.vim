" ===================
" ====== basic ======
" ===================

set list listchars=tab:\ \ ,trail:· " display tabs and trailing spaces visually
set gcr=a:blinkon0                  " disable cursor blink
autocmd BufWritePre * :%s/\s\+$//e  " auto trailing after save
set shiftwidth=2                    " Use indents of 2 spaces
set tabstop=2                       " An indentation every four columns
set softtabstop=2                   " Let backspace delete indent
set nostartofline
set nocursorline
set noshowcmd
set linespace=3
set nofixendofline

" http://vimhelp.appspot.com/change.txt.html#fo-table
au FileType * set fo-=c fo-=r fo-=o

" ===================
" ====== theme ======
" ===================

set background=dark    " set dark background
colorscheme zenburn      " set theme

if has('gui_running')
  set macligatures
  set guifont=Monaco:h17
endif

" Vim keep window position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" ===================
" ====== maps =======
" ===================

" file
nnoremap <Leader>s :update<CR>
nnoremap <leader>S :saveas <C-R>=expand("%")<CR>
" nnoremap <leader>fA :saveas <C-R>=expand("%:p:h")<CR>/
nnoremap <leader>E :edit!<CR>
nnoremap <leader><Tab> :b#<CR>

" cancel highlighting
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
" nnoremap <silent> <C-g><C-g> :let @/=""<CR>

" cancel command
nmap <c-g> <ESC>
imap <c-g> <ESC>
vmap <c-g> <ESC>

" rollbar
nnoremap <C-Up> <C-e>
nnoremap <C-Down> <C-y>

" jump paragraph
nnoremap <A-Up> {
nnoremap <A-Down> }

" cursor navigation
inoremap <M-f> <ESC><Space>wi
inoremap <M-b> <Esc>bi

nnoremap <M-b> b
nnoremap <M-f> w

vnoremap <M-b> b
vnoremap <M-f> w

" next/previous highlighting
noremap n nzz
noremap N Nzz
nnoremap * *zz
nnoremap # #zz

" new lines
nnoremap <leader>o o<cr>
nnoremap <leader>O O<esc>O
nnoremap <leader>p o<esc>p
nnoremap <leader>P O<esc>P

" kill buffer
:nnoremap <Space>B :bd<Enter>

