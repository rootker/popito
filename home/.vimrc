"┓ ┳o┏┏┓  ┏━┓┏━┓┏┓┓┳━┓o┏━┓
"┃┏┛┃┃┃┃   ┃  ┃ ┃┃┃┃┣━ ┃┃ ┳
"┗┛ ┇┛ ┇  ┗━┛┛━┛┇┗┛┇  ┇┇━┛

"leader key
let configs = [ 
\  "general",
\  "functions",
\  "commands",
\  "plugins",
\  "plugin-settings",
\  "keybinds",
\]
".xinitrc
for file in configs " source files
  let x = expand("~/.vim/config/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor

set fillchars+=vert:\ 
hi Normal guibg=NONE ctermbg=NONE
let g:clap_enable_background_shadow = v:false
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
command W w !sudo tee % > /dev/null 

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>  " cd into current file in folder


" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/stenai/note-bash.md<cr>
nmap <C-s> <Plug>MarkdownPreview
nmap <C-.> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
set clipboard=unnamedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nmap <leader>P "+P
nnoremap ZZ :wqall<CR>
nnoremap <silent> <C-b> :update<CR> 
set foldmethod=syntax
"set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
