
" ┏━┓╺┳╸┏━┓╺┳╸╻ ╻┏━┓╻  ╻┏┓╻┏━╸
" ┗━┓ ┃ ┣━┫ ┃ ┃ ┃┗━┓┃  ┃┃┗┫┣╸
" ┗━┛ ╹ ╹ ╹ ╹ ┗━┛┗━┛┗━╸╹╹ ╹┗━╸
" lightline http://git.io/lightline
" █▓▒░ wizard status line

let s:base03 = [ '#151513', 232 ]
let s:base02 = [ '#3B4252', 234 ]
let s:base01 = [ '#4e4e43', 239 ]
let s:base00 = [ '#666656', 242  ]
let s:base0 = [ '#808070', 244 ]
let s:base1 = [ '#949484', 242 ]
let s:base2 = [ '#a8a897', 248 ]
let s:base3 = [ '#e8e8d3', 234 ]
let s:yellow = [ '#EBCB8B', 11 ]
let s:orange = [ '#7A7A57', 3 ]
let s:red = [ '#BF616A', 1 ]
let s:magenta = [ '#B48EAD', 13 ]
let s:cyan = [ '#87ceeb', 4 ]
let s:green = [ '#A3BE8C', 3 ]
let s:none = [ 'none', 'none' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:cyan ], [ s:base3, s:base02 ] ]
let s:p.normal.right = [ [ s:base02, s:base00 ], [ s:base2, s:base02 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:none, s:none ] ]
let s:p.inactive.middle = copy(s:p.normal.middle)
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base02, s:yellow ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

"let g:lightline#colorscheme#nord#palette = lightline#colorscheme#flatten(s:p)

"set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'rosepine',
       \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_use_clangd = 1
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu
let g_ycm_key_list_select_completion=[]
let g_ycm_key_list_previous_completion=[]
" ------- BOOKMARKS
let g:bookmark_highlight_lines = 1
let g:bookmark_sign = '🐱'
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>x <Plug>BookmarkClearAll
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=black ctermfg=NONE
highlight BookmarkAnnotationLine ctermbg=black ctermfg=NONE
nmap <F8> :TagbarToggle<CR>
