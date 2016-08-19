"statusline {{{
:set statusline=%f         " Path to the file
:set statusline+={%y}        " Filetype of the filsv\sv
:set statusline+=%=        " Switch to the right side
:set statusline+=Line:        " Switch to the right side
:set statusline+=%l        " Current line
:set statusline+=/         " Separator
:set statusline+=%L        " Total lines
:set statusline+=lines
" }}}
"abbreviations {{{
:iabbrev angNC app.controller('',()=>{})
:iabbrev angNF app.filter('',()=>{})
:iabbrev angND app.directive('',()=>{})
" }}}
" logging {{{
:nnoremap <leader>cl viw<esc>a)<esc>hbiconsole.log(<esc>lel
" }}}
"replace all occurences of the word
:nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>
"remove all occurences of the word
:nnoremap <Leader>dw :%s/\<<C-r><C-w>\>//g<cr>
syntax on
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set noswapfile
:nmap <F1> :bp<CR>
:imap <F1> <Esc> :bp<CR>
:nmap <F2> :w<CR>
:imap <F2> <Esc> :w<CR>
:nmap <F3> :bn<CR>
:imap <F3> <Esc> :bn<CR>
:nmap <F7> :Gulp<CR>
:imap <F7> <Esc> :Gulp<CR>
:nmap <F5> :NERDTreeToggle<CR>
:nmap <F10> :Goyo<CR>
:nmap 0 dd
:nmap 9 :bd <CR>
" cool mappings :)
colorscheme elflord
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :so%<cr>
" push updated vimrc to github
:nnoremap <leader>gv :!~/Scripts/./cpvimrc.sh<cr>
:nnoremap <leader>p Yp
:nnoremap fq :q<cr>
:inoremap jk <esc>
:inoremap fj <esc>:w<cr>
:nnoremap fj :w<cr>
:inoremap <esc> <nop>
"parenthesis remap
:onoremap p i(
:onoremap " i"
:onoremap ' i'
:onoremap [ i[
"folder switch
"goto home folder
:nnoremap <leader>gh :cd ~/<CR>
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/goyo.vim'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'digitaltoad/vim-pug'
Plugin 'KabbAmine/gulp-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'groenewege/vim-less'
Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()            " required
filetype plugin indent on    " required
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
:set list listchars=tab:>-,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
:set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
:set list listchars=tab:»·,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"disable GUI
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"js snippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"colorcolumn
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
