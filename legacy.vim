" Colorscheme
set termguicolors
set background=dark
let g:gruvbox_material_background='hard'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_foreground='original'
colorscheme gruvbox-material

" Rainbow parens
let g:rainbow_active = 1

" Rooter default non project directory
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" Highlight serarch results
set hlsearch
set incsearch

" No hidden buffers
set hidden&

" Faster updates
set updatetime=100

" Automatically read on change
set autoread

" Line wrap
set nowrap

" Others
set encoding=UTF-8
set t_Co=256

" .vert = glsl
augroup vert_ft
  au!
  autocmd BufNewFile,BufRead *.vert     set filetype=glsl
augroup END

" .frag = glsl
augroup frag_ft
  au!
  autocmd BufNewFile,BufRead *.frag     set filetype=glsl
augroup END

au FileType text set colorcolumn=80

" Easy search/replace with current visual selection
xnoremap ;s y:%s/<C-r>"//g<Left><Left>

" Easy search/replace on current line with visual selection
xnoremap ;ls y:.s/<C-r>"//g<Left><Left>

" Clear search selection
map <C-[> :noh <CR>

