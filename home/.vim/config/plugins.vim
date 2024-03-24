" if pluginstall not exits install it for new setup vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'ryanoasis/vim-devicons'     " vim icons support
"Plug 'lilydjwg/colorizer'       
Plug 'mattn/emmet-vim' 		  " exapnds in html
Plug 'mhinz/vim-signify'	  " git logs
Plug 'itchyny/lightline.vim'      " vim statusline
Plug 'chrisbra/colorizer'         " color highlight
Plug 'preservim/nerdcommenter'    " comments 
Plug 'tpope/vim-surround'         " tag
"Plug 'ycm-core/YouCompleteMe'     " autocomplete for gcc and other
Plug 'flazz/vim-colorschemes'     " syntax colorschemes
"Plug 'andymass/vim-matchup'       " match if or while ...
"Plug 'preservim/tagbar'           " usefull in c++
"Plug 'MattesGroeger/vim-bookmarks' " bookmarks line
Plug 'machakann/vim-highlightedyank' "highlight selected text
Plug 'Raimondi/delimitMate'       " auto close bracket

" LANGUAGE SUPPORT
"Plug 'unblevable/quick-scope'
Plug 'itchyny/vim-gitbranch'
"Plug 'mangeshrex/everblush.vim'
Plug 'tpope/vim-markdown'         
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'tpope/vim-markdown'
"Plug 'chase/vim-ansible-yaml'    
Plug 'iamcco/markdown-preview.nvim'
Plug 'romainl/vim-cool'
" ------------- OFF ------------------
" Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'chikamichi/mediawiki.vim'
"Plug 'https://github.com/nathanaelkane/vim-indent-guides'
"Plug 'ryanoasis/vim-devicons'
"Plug 'https://github.com/junegunn/goyo.vim'
"Plug 'diepm/vim-rest-console'
"Plug 'https://github.com/hashivim/vim-terraform.git'
"Plug 'https://github.com/tweekmonster/django-plus.vim'
"Plug 'https://github.com/pangloss/vim-javascript'
"Plug 'pearofducks/ansible-vim'
"Plug 'lervag/vimtex'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'godlygeek/tabular'
"Plug 'neoclide/coc.nvim'
call plug#end()
filetype indent plugin on


"colorscheme everblush
colorscheme jelleybeans
"set ColorToggle
