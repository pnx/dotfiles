:language en_US
:set encoding=UTF-8

:runtime plugins.vim
:runtime tab.vim
:runtime git.vim
:runtime binds.vim
:runtime terminal.vim
:runtime coc.vim
:runtime nerdtree.vim

:syntax on
:set number
:set numberwidth=4
:set cursorline
:set showmode
:set guicursor=a:ver100,c-ci-cr:hor80-blinkon100-blinkwait300

" -- Color scheme
let g:kodex#color_cursor_line_insert=1
:colorscheme kodex

let g:lightline={
  \ "colorscheme": "one" 
\ }

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
"set statusline+=\ %{GitStatus()}\ %y\ %f:%l

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=L\ %l:%c\ \%m\ 

" Show the status on the second to last line.
set laststatus=2

" }}}
