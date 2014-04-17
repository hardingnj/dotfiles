source /.mounts/labs/boutroslab/private/Resources/etc/vimrc

autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadvie

set tabstop=4
"set expandtab
set shiftwidth=4
"set shiftround
colorscheme desert
set bg=dark

set hidden
set backspace=2
set backspace=indent,eol,start

syntax on
filetype on
au BufNewFile,BufRead *.Rnw set filetype=tex
au BufNewFile,BufRead *.tex set filetype=tex
:nnoremap <F5> :buffers<CR>:buffer<Space>

map <S-OC> :tabn<CR>
map <S-OD> :tabp<CR>

version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map Q gq
snoremap U b<BS>U
snoremap \ b<BS>\
snoremap ^ b<BS>^
snoremap ` b<BS>`
nmap gx <Plug>NetrwBrowseX
snoremap <Left> bi
snoremap <Right> a
"snoremap <BS> b<BS>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
