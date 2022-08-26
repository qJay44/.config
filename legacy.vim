" Colorscheme
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Rainbow parens
let g:rainbow_active = 1

" Rooter options
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

" Enter/exit fullscreen function
function Neovide_fullscreen()
  let g:neovide_fullscreen = g:neovide_fullscreen == v:false ? v:true : v:false
endfunction

" Enter/exit fullscreen keymap
map <F11> :call Neovide_fullscreen()<CR>

" Easy search/replace with current visual selection
xnoremap ;s y:%s/<C-r>"//g<Left><Left>

" Easy search/replace on current line with visual selection
xnoremap ;ls y:.s/<C-r>"//g<Left><Left>

" Clear search selection
map <C-[> :noh <CR>

" Highlight groups
hi! Aqua guifg=#8ec07c guibg=NONE
hi! Red guifg=#fb4934 guibg=NONE
hi! Orange guifg=#fe8019 guibg=NONE
hi! Yellow guifg=#fabd2f guibg=NONE

" Link highlight groups
hi! link javascriptTSKeywordOperator Orange
hi! link TSString Aqua
hi! link TSInclude Red
hi! link TSConstructor Yellow

