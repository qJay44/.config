require'nvim-treesitter.install'.compilers = { 'clang' }
require'nvim-treesitter.configs'.setup{
  ensure_installed = { "cpp", "python", "javascript", "lua", "glsl" },
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  rainbow = { enable = true, extended_mode = true, max_file_lines = nil }
}

