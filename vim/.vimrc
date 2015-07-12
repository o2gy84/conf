set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set t_Co=256  " 256-color terminal

syntax on
color wombat256

augroup quickfix
    " au! just delete any old autocommands, see help
    au!
    autocmd FileType qf nnoremap <buffer> <Enter> <C-w><Enter><C-w> " <-- horizontal split. vertical: <C-w><Enter><C-w>L
augroup END

au BufNewFile,BufRead *.cpp set syntax=cpp11

map <F2> :execute "vimgrep /" . expand("<cword>") . "/ **/*.c **/*.cpp **/*.h **/*.hpp **/*.xs **/*.pm **/*.pl **/*.py" <Bar> cw<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
nmap <F5> :NERDTreeToggle<CR><C-w><Right>
nmap <F6> :TagbarToggle<CR>

map <S-l> :tabnext<CR>
map <S-k> :tabprevious<CR>
map tg :tabprevious<CR>

map ll :normal $<CR>
map kk :normal ^<CR>
map jj vip<CR>
nmap hh :LinesCommentNextState <CR>
vmap hh :LinesCommentNextState <CR>

map <F12> :!/usr/bin/ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" TODO: use better way
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
" map <F7> :tabnew<CR>:!make<CR>:!sleep 1<CR>:tabclose<CR>
