if exists('g:neovide')
  let g:neovide_refresh_rate = 90
  let g:neovide_scroll_animation_length = 0.5
  let g:neovide_remember_window_position = v:true
  let g:neovide_remember_window_size = v:true
else
  set termguicolors
  set t_Co=256
endif

let g:underline_style = has('nvim-0.8') ? 'gui=underdashed' : 'gui=underdash'
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Colorscheme
if !exists('g:loaded_color')
  let g:loaded_color = 1

  set background=dark
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
endif

" Rooter options
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" No autocomment on next line
set formatoptions-=cro

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

" Popup menu colors
hi! Pmenu guibg=#1d2021
hi! PmenuSel guibg=#303436 guifg=#ffffff

" Syntax highlight groups
hi! javascriptTSKeywordOperator guifg=#fe8019 guibg=NONE
hi! TSString guifg=#8ec07c guibg=NONE
hi! TSInclude guifg=#fb4934 guibg=NONE
hi! TSConstructor guifg=#fabd2f guibg=NONE
hi! vimOper guifg=* guibg=NONE
hi! TSOperator guifg=* guibg=NONE
hi! NvimTreeGitDirty guifg=#fabd2f
hi! NvimTreeGitNew guifg=#8ec07c
hi! SignColumn guifg=* guibg=NONE

" Diagnostics
hi! DiagnosticError guifg=#fb4934

" GitSings
hi! GitSignsAdd guifg=#b8bb26 guibg=NONE
hi! GitSignsChange guifg=#fabd2f guibg=NONE
hi! GitSignsDelete guifg=#fb4934 guibg=NONE

" Telescope
hi! TelescopeSelection guifg=* guibg=#3c4144

" Illuminate
execute 'hi! IlluminatedWordText ' . g:underline_style
execute 'hi! IlluminatedWordRead ' . g:underline_style
execute 'hi! IlluminatedWordWrite ' . g:underline_style

" cmp item highlight
hi! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
hi! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
hi! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
hi! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
hi! CmpItemKindText guibg=NONE guifg=#9CDCFE
hi! CmpItemKindFunction guibg=NONE guifg=#C586C0
hi! CmpItemKindMethod guibg=NONE guifg=#C586C0
hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
hi! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
hi! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
