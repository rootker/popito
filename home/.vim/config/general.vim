let mapleader = " "    " the leader key
syntax on       

if has("autocmd")      " Tab size for type of files
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType asm setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType cpp setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
endif

" Temporarily disable filetype plugin
filetype off

set relativenumber  " use relativenumbers
set backup          " make backup files
set directory=~/.vim/temp/tmp     " directory to place swap files in
set backupdir=~/.vim/temp/backups " where to put backup files
set undodir=~/.vim/temp/undos
set viminfo+=n~/.vim/temp/viminfo
set undofile        " persistent undos - undo 
set showmode        " Display current editing mode
set title           " Make the window title reflect the file being edited
set hlsearch        " Highlight search results
set nonu!           " line number
set ignorecase	    " ignore case
set smartcase       " smart case in searching 
" set noshowmode    " to get rid of thing like --INSERT--
" set noshowcmd     " to get rid of display of last command
" set shortmess+=F  " to get rid of the file name displayed 
" set cursorline    " Highlight the current line
set magic           " magic search strings
set showcmd         " show partial command as it is typed
set ttyfast         " optimize for fast terminal connections
set backspace=2     " Allow backspacing over everything
set nohidden        " Actually delete a buffer when closing a tab
set scrolloff=3     " Scroll 3 lines before reaching the current viewport end
set foldmethod=marker " Use markers for folding
set tabpagemax=50   " Max tabs for vim -p
set modeline        " Use modeline
set nomodeline      " Security options
set laststatus=2    " show status line
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
" set statusline=%F[%L][%{&ff}]%y[%04l,%04v]
" hi statusline guibg=NONE guifg=white 
set guioptions=aci "hide the options in gvim

"very useful for yaml files
autocmd Filetype yaml set cursorcolumn
autocmd Filetype yml set cursorcolumn
"autocmd Filetype cpp set cursorcolumn
autocmd Filetype python set cursorcolumn
autocmd BufWritePre *.html :%s/\s\+$//e " clear empty spaces in end wsaving

" Toggle whitespace with <leader>w
set listchars=tab:▸\ ,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" Toggle line numbers with ,n
nmap <silent> <leader>n :set nonu!<CR>

" Toggle paste mode with F3
set pastetoggle=<F3>
hi Folded ctermbg=17
hi Folded ctermfg=159
hi CursorLine cterm=none ctermbg=236
hi ColorColumn cterm=none ctermbg=236
