" :help ftdetect
" If you want to change the filetype only if one has not been set
" autocmd BufRead,BufNewFile *.rkt,*.rktl,*.rktd setfiletype scheme
" If you always want to set this filetype
" autocmd BufRead,BufNewFile *.rkt,*.rktl,*.rktd set filetype=scheme
autocmd BufRead,BufNewFile *.rkt,*.rktl,*.rktd set filetype=racket
