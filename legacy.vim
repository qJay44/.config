" Colorscheme
set termguicolors
set background=dark
let g:gruvbox_material_background='hard'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_foreground='original'
colorscheme gruvbox-material

" Airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0

" Rainbow parens
let g:rainbow_active = 1

" Rooter default non project directory
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" Syntax highlighting
syntax on

" Position in code
set number

" Highlight serarch results
set hlsearch
set incsearch

" Disable backup files
set nobackup
set nowritebackup

" No hidden buffers
set hidden&

" Faster updates
set updatetime=100

" Automatically read on change
set autoread

" Line wrap
set nowrap

" Others
set noexpandtab
set autoindent
set smartindent
set signcolumn=yes
set encoding=UTF-8
set t_Co=256
set noswapfile

" .vert = glsl
augroup vert_ft
  au!
  autocmd BufNewFile,BufRead *.vert     set filetype=glsl
augroup END

" " .frag = glsl
augroup frag_ft
  au!
  autocmd BufNewFile,BufRead *.frag     set filetype=glsl
augroup END

au FileType text set colorcolumn=80

" easy search/replace with current visual selection
xnoremap ;s y:%s/<C-r>"//g<Left><Left>

" easy search/replace on current line with visual selection
xnoremap ;ls y:.s/<C-r>"//g<Left><Left>

map <Esc> :noh <CR>

