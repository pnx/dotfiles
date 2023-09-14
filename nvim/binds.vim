" Keybinds
let mapleader=","
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

:nmap <c-v> :Vex<CR>

:noremap <Home> 0w
:inoremap <Home> <ESC>0wi

" -- NERDTree
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" -- Insert date
:noremap <C-D> a<C-R>=strftime('%F')<CR><ESC>
:xmap <C-D> di<Space><C-R>=strftime('%F')<CR><Esc>

