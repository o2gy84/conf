set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/Valloric/YouCompleteMe'
call plug#end()

let g:ycm_clangd_binary_path = "/usr/bin/clangd"
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
let g:ycm_error_symbol = 'e'
let g:ycm_warning_symbol = 'w'

map <C-]> :tab split<CR>:YcmCompleter GoToDeclaration<CR>
map <C-\> :tab split<CR>:YcmCompleter GoToDefinition<CR>
map <C-[> :YcmCompleter GoToReferences<CR>
map <F2> :YcmCompleter GetDoc<CR>

" map <F4> :YcmCompleter GetType<CR>
" for GO :YcmCompleter GoToType
" for GO :YcmCompleter GoToImplementation

