call plug#begin('~/.vim/plugged')
set nocompatible
set number
" ncm2 and nvim-R
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
" ale
Plug 'w0rp/ale'
let g:ale_linters = {'php': ['php']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" nerdtree
Plug 'scrooloose/nerdtree'

" better javascript syntax
Plug 'pangloss/vim-javascript'

" vimtex
Plug 'lervag/vimtex'

" fold-cycle
Plug 'arecarn/vim-fold-cycle'

" riv.vim
Plug 'gu-fan/riv.vim'

call plug#end()

set background=dark
colorscheme gruvbox
set backspace=eol,start,indent
set whichwrap+=<,>,h,l 
set ignorecase
set smartcase
set hlsearch
set incsearch
set mat=2
set cursorline
set nowrap
set visualbell
set colorcolumn=80
set listchars=tab:>-
set foldlevel=0
set foldenable
set noexpandtab
set autoindent
function! FoldText()
	return repeat(" ", indent(v:foldstart)) . trim(getline(v:foldstart))[0:-1] . " +" . repeat(" ", winwidth(0))
endfunction
set foldtext=FoldText()
set foldmethod=marker
let g:vimtex_compiler_progname = 'nvr'
set splitbelow
set splitright
set ma
runtime foldsearch.vim
let R_assign = 0
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)
MapToggle <leader>n number
map <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

nnoremap <leader>i <C-i>
nnoremap <leader>o <C-o>
nnoremap `i <C-i>
nnoremap `o <C-o>
nnoremap <Esc> <Esc>:noh<cr>
nnoremap P [p
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
nnoremap <Tab> a<C-t><Esc>
nnoremap <S-Tab> a<C-d><Esc>
nnoremap _ <C-w>_
nnoremap \| <C-w>\|
vnoremap <Tab> >>
vnoremap <S-Tab> <<
nmap zO <Plug>(fold-cycle-open-all)
nmap zC <Plug>(fold-cycle-close-all)
nmap zA <Plug>(fold-cycle-toggle-all)
autocmd FileType java inoremap `` <Esc>/<++><Enter>"_c4l
autocmd FileType java inoremap `if if(<@@>){<Enter><++><Enter>}<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `for for(<@@>){<Enter><++><Enter>}<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `el else{<Enter><@@><Enter>}<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `ei else if(<@@>){<Enter><++><Enter>}<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `wh while(<@@>){<Enter><++><Enter>}<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `do do{<Enter><@@><Enter>}while(<++>)<++><Esc>?<@@><Enter>"_c4l
autocmd FileType java inoremap `ol System.out.println()<++><Esc>?(<Enter>a
autocmd FileType java inoremap `ou System.out.print()<++><Esc>/?<Enter>a
autocmd FileType rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
syntax on
au BufRead,BufNewFile *.txt set ft=workflowy
au FileType workflowy runtime workflowy.vim
au FileType python setl sw=8 ts=8 sts=8 autoindent noexpandtab
au BufRead,BufNewFile *.html set filetype=html
au FileType html setl sw=2 ts=2 sts=2 autoindent noexpandtab
au BufRead,BufNewFile *.php set filetype=php
au FileType php setl sw=2 ts=2 sts=2 autoindent noexpandtab
au FileType javascript setl sw=2 ts=2 sts=2 autoindent noexpandtab
