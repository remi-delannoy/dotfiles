set shell=/usr/bin/sh
" leader key
let mapleader=','

call plug#begin('~/.local/share/nvim/plugged') 
Plug 'ayu-theme/ayu-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline', { 'do': ':Update RemotePlugins' }
Plug 'easymotion/vim-easymotion', { 'do': ':UpdateRemotePlugins' } 
Plug 'ctrlpvim/ctrlp.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/bufexplorer.zip', { 'do': ':UpdateRemotePlugins' }
Plug 'JuliaEditorSupport/julia-vim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"plugins config
"ayu
set termguicolors
let ayucolor="dark"
colorscheme ayu

"ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter=1
nmap <silent> <C-Right> <Plug>(ale_previous_wrap)
nmap <silent> <C-Left> <Plug>(ale_next_wrap)
map <Leader><Space> :ALEGoToDefinition<cr>

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

"vim-airline
let g:airline#extensions#ale#enabled = 1

"easymotion
map <Leader> <Plug>(easymotion-prefix)

"ctrlp
map <C-f> <Plug>(ctrlp)

"bufexplorer
noremap <Leader>o :BufExplorer<cr>

" mouse support
set mouse=a

"tab length
set shiftwidth=2
set expandtab

"easy block moving
vnoremap <Tab> > gv
vnoremap <S-Tab> < gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
xnoremap <C-Up> xkP`[V`]
xnoremap <C-Down> xp`[V`]

"navigating between splits with C-hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ctrl+c like copy
noremap <C-C> "+y

" display line number
set number

" goto last position when opening a file
autocmd BufReadPost * exe "normal! g'\""
" format python file with black
autocmd BufWritePost *.py silent !black <afile>  
autocmd BufWritePost *.py edit  

" format C/C++ file with clang-format
autocmd BufWritePost *.h,*.c,*.cpp silent !clang-format -i <afile>  
autocmd BufWritePost *.h,*.c,*.cpp edit  

" autocompile tex file
autocmd BufWritePost *.tex silent !/home/remi/.local/bin/latex_compile <afile> 


