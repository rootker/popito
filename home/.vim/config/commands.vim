" json pretty print
function! JSONify()
  %!python -mjson.tool
  set syntax=json
endfunction
command J :call JSONify()
nnoremap <silent> <leader>j <esc>:call JSONify()<cr><esc>

" remove highlighting
nnoremap <silent> <esc><esc> <esc>:nohlsearch<cr><esc>

" remove trailing white space
command Nows :%s/\s\+$//

" remove blank lines
command Nobl :g/^\s*$/d

" toggle spellcheck
command Spell :setlocal spell! spell?
nnoremap <silent> <leader>s :setlocal spell! spell?

" make current buffer executable
command Chmodx :!chmod a+x %

" fix syntax highlighting
command FixSyntax :syntax sync fromstart

" pseudo tail functionality
command Tail :set autoread | au CursorHold * checktime | call feedkeys("G")


" let's make some textmode art!
function! AsciiMode()
  e ++enc=cp850
  set nu!
  set virtualedit=all
  set colorcolumn=80
endfunction
command Ascii :call AsciiMode()


function! URLdecode(str) abort
  let str = substitute(substitute(substitute(a:str,'%0[Aa]\n$','%0A',''),'%0[Aa]','\n','g'),'+',' ','g')
  return iconv(substitute(str,'%\(\x\x\)','\=nr2char("0x".submatch(1))','g'), 'utf-8', 'latin1')
endfunction
command URLdecode :call URLdecode()
