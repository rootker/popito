
nmap <leader>t !term<CR>
nnoremap <leader>nh :noh<CR>
nnoremap <leader>t :term<CR> 
nnoremap <leader>php :!php -l %<CR> 
"Syntax check php code
nmap <leader>l :bnext<CR> 
" moves to the next buffer
nmap <leader>h :bprevious<CR> 
" moves to the previous buffer
nmap <leader>bd :bd<CR>
" closes the current buffer, moves to the previous one
nmap <leader>BD :bd!<CR> 
" forces buffer close
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>
" file operations
nmap <C-s> :w!<CR>
nmap <C-q> :q<CR>
map <F9> :YcmCompleter FixIt<CR>
" gcc compile and run
map <leader>c :w<CR> :!clear;make %<;echo; ./%<<CR>
map <leader>o :w<CR> :!clear;make %<;echo; %<<CR>
