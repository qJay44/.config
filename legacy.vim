if exists('g:neovide')
  let g:neovide_refresh_rate = 90
  let g:neovide_scroll_animation_length = 0.5
  let g:neovide_remember_window_position = v:true
  let g:neovide_remember_window_size = v:true
  let g:neovide_transparency = 0.85
  let g:neovide_fullscreen=v:false
else
  set termguicolors
  set t_Co=256
endif

let g:underline_style = has('nvim-0.8') ? 'gui=underdashed' : 'gui=underdash'
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:cmake_link_compile_commands=1
let g:cmake_generate_options=['-G"MinGW Makefiles"']

" Colorscheme
if !exists('g:loaded_color')
  let g:loaded_color = 1

  set background=dark
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
endif

" Rooter options
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh', '*.md', "main.py"]

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
hi! @string guifg=#8ec07c guibg=NONE
hi! @include guifg=#fb4934 guibg=NONE
hi! @operator guifg=* guibg=NONE
hi! @type.qualifier guifg=#fb4934 guibg=NONE
hi! @type.builtin guifg=#fb4934 guibg=NONE
hi! NvimTreeGitDirty guifg=#fabd2f
hi! NvimTreeGitNew guifg=#8ec07c
hi! SignColumn guifg=* guibg=NONE
hi! @variable.builtin guifg=#fe8019 guibg=NONE

" Diagnostics
hi! DiagnosticError guifg=#fb4934
" hi! LspDiagnosticsLineNrWarning guifg=red
" sign define LspDiagnosticsSignWarning numhl=LspDiagnosticsLineNrWarning

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

" Cmp item highlight
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

" Navic highlight
" Stolen from catppuccin theme
" Unused icon groups: Color, Default, Folder, Reference, Snippet, Unit, Value
let g:navic_colors = [
      \ ["Array", "#fabd2f"],
      \ ["Boolean", "#fabd2f"],
      \ ["Folder", "#df8e1d"],
      \ ["Class", "#df8e1d"],
      \ ["Constant", "#fabd2f"],
      \ ["Constructor", "#b8bb26"],
      \ ["Enum", "#40a02b"],
      \ ["EnumMember","#d20f39"],
      \ ["Event", "#b8bb26"],
      \ ["Field", "#40a02b"],
      \ ["File",  "#b8bb26"],
      \ ["Function", "#b8bb26"],
      \ ["Interface", "#df8e1d"],
      \ ["Key", "#ea76cb"],
      \ ["Keyword","#ea76cb"],
      \ ["Method", "#b8bb26"],
      \ ["Module", "#b8bb26"],
      \ ["Namespace", "#b8bb26"],
      \ ["Null", "#fabd2f"],
      \ ["Number", "#fabd2f"],
      \ ["Object", "#fabd2f"],
      \ ["Operator", "#04a5e5"],
      \ ["Package", "#b8bb26"],
      \ ["Property", "#40a02b"],
      \ ["String", "#40a02b"],
      \ ["Struct", "#b8bb26"],
      \ ["TypeParameter", "#b8bb26"],
      \ ["Variable", "#dd7878"],
      \ ]

hi! NavicText guifg=#83a598 guibg=#3c3836
hi! NavicSeparator guibg=#3c3836
for kind in g:navic_colors
  execute "highlight! NavicIcons" . kind[0] . " guifg=" . kind[1] . " guibg=#3c3836"
endfor

