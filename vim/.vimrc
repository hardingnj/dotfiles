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

" NH shortcuts for hiding numbers
cabbr UCOPY set list|set number
cabbr COPY set nolist|set nonumber
map [ :COPY
map ] :UCOPY

" backspace-s replaces word under cursor
nnoremap \s :%s/\<\>/

" argument rewrapo
function! Indent()
  normal ^%jI	k^
endfunction
function! Indent2()
  normal ^i	
endfunction

nnoremap <silent> <leader>e :call argumentrewrap#RewrapArguments()<CR>:call Indent()<CR>
nnoremap <silent> <leader>w :call argumentrewrap#RewrapArguments()<CR>:call Indent2()<CR>

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
