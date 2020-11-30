" Create pdf from latex file
:map <F5> <Esc>:w <CR>:! pdflatex -output-directory=%:h % <CR> <CR>
" Open current file with pdf expansion
":map <F6> :! killall "PDF Expert" <CR> <CR>:! open -a '%:r'$'.pdf' <CR> <CR>
:map <F6> :! killall "PDF Expert" <CR> <CR>:! open '%:r'$'.pdf' <CR> <CR>
