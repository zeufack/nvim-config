" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" add the game vim-be-good to lean how to use vim

Plug 'ThePrimeagen/vim-be-good'


" add CoC aka Conquer of Completion to provide a lot great features like
" proper auto completion

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"add tokyo dart theme to vim

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" add a status bar to vim
 Plug 'itchyny/lightline.vim'
call plug#end()
" Auto set file line number
set number

" Enable type file detection.
filetype on
" Allow auto formatting 
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"Auto comple using CoC
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Set colorsheme to tokyonight
colorscheme tokyonight-storm

" Set auto-close for ([{"and '

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Set relative number
set relativenumber    

