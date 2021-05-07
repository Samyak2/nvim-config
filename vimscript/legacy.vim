" legacy stuff that couldn't move to lua

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" tabs and spaces for specific files
autocmd Filetype javascript,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype cpp,c setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype go setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab

" spell check for specific files
autocmd FileType latex,tex,md,markdown setlocal spell

" comment strings for specific files
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType c,cpp,java setlocal commentstring=//\ %s
