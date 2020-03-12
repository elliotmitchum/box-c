" 
" .vimrc
"

"
" Colors.
"

" Enable syntax processig.
syntax enable

"
" Interface.
"

" Enable line numbers.
set number

" Show last command.
set showcmd

" Highlight current line.
set cursorline

" Show current position.
set ruler

" Ignore case when searching.
set ignorecase

" Add right margin on 80.
set colorcolumn=80

"
" Editing.
"

" 1 tab == 4 spaces.
set shiftwidth=4
set tabstop=3

"
" Key Mappings.
"

" Toggle NERDTree panel.
map <f8> :NERDTreeToggle<cr>
map <f9> :!gcc % && ./a.out<cr>
"
" Plugin Configuration.
"

" NERDTree

" Remove components from UI.
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Show hidden files.
let NERDTreeShowHidden=1

" vim-airline

" Enable tab line.
let g:airline#extensions#tabline#enabled = 1

"
" vim-plug
"

" Configure plugins.
call plug#begin('~/.local/share/nvim/plugged')

" Plugin: editorconfig.
Plug 'editorconfig/editorconfig-vim'

" Plugin: vim-sensible
Plug 'tpope/vim-sensible'

" Plugin: nerdtree
" Activate on toggle.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin: vim-airline
Plug 'vim-airline/vim-airline'

" Initialise plugins.
call plug#end()
 
