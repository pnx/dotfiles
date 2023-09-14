" --- Tab Settings
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" Set hardtabs for make
:autocmd FileType make setlocal ts=4 sts=0 sw=4 noexpandtab

" Set 2 softtab for yaml files
:autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Set hardtabs for cpp
:autocmd FileType cpp setlocal ts=8 sts=0 sw=8 noexpandtab

