execute pathogen#infect()

set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set hlsearch
" temporary disable highliting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set t_Co=256  " 256-color terminal

syntax on
color wombat256
" for white themes
" color devC++

augroup quickfix
    " au! just delete any old autocommands, see help
    au!
    autocmd FileType qf nnoremap <buffer> <Enter> <C-w><Enter><C-w> " <-- horizontal split. vertical: <C-w><Enter><C-w>L
augroup END

let g:go_version_warning = 0
let g:go_autodetect_gopath = 1
let g:go_def_mapping_enabled = 1
let g:go_textobj_enabled = 0
let g:go_fmt_autosave = 0
let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
" let g:go_highlight_generate_tags = 1

au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11

map <F2> :execute "vimgrep /" . expand("<cword>") . "/ **/*.c **/*.cpp **/*.h **/*.hpp **/*.xs **/*.pm **/*.pl **/*.py" <Bar> cw<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
nmap <F5> :NERDTreeToggle<CR><C-w><Right>
nmap <F6> :TagbarToggle<CR>
map <F7> :!gotags -R -f tags -silent .<CR>
map <F12> :!/usr/bin/ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


map <S-l> :tabnext<CR>
map <S-k> :tabprevious<CR>
map tg :tabprevious<CR>

map ll :normal $<CR>
map kk :normal ^<CR>
map jj vip<CR>
nmap hh :LinesCommentNextState <CR>
vmap hh :LinesCommentNextState <CR>
map [[ :normal [{<CR>
map ]] :normal ]}<CR>


" TODO: use better way
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :split<CR>:exec("tag ".expand("<cword>"))<CR>
