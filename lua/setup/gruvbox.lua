require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = true,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    -- General
    Normal                  = { bg   = '#1d2021'       },
    CmpItemKindFunction     = { link = 'GruvboxGreen'  },
    CmpItemKindMethod       = { link = 'GruvboxGreen'  },
    NavicIconsFunction      = { link = 'GruvboxGreen'  },
    NavicIconsMethod        = { link = 'GruvboxGreen'  },
    Pmenu                   = { link = 'Gruvboxfg4'    },
    PmenuSel                = { link = 'CursorLine'    },
    TelescopeSelectionCaret = { link = 'GruvboxFg0'    },
    TelescopePromptPrefix   = { link = 'GruvboxFg0'    },
    GitSignsChange          = { link = 'GruvBoxYellow' },
    FocusedSymbol           = { link = 'CursorLine'    },

    -- Treesitter
    ['@variable']         = { link = 'GruvboxBlue'   },
    ['@string']           = { link = 'GruvboxAqua'   },
    ['@include']          = { link = 'GruvboxRed'    },
    ['@type.qualifier']   = { link = 'GruvboxRed'    },
    ['@type.builtin']     = { link = 'GruvboxRed'    },
    ['@variable.builtin'] = { link = 'GruvboxOrange' },

    -- Git signs
    ['NvimTreeGitDirty'] = { link = 'GruvboxYellow' },
    ['NvimTreeGitNew']   = { link = 'GruvboxAqua'   },

    -- LSP semantics to match Treesitter
    ["@lsp.type.class"]         = { link = "@type"  },
    ["@lsp.type.decorator"]     = { link = "Function"   },
    ["@lsp.type.enum"]          = { link = "Type"       },
    ["@lsp.type.enumMember"]    = { link = "Constant"   },
    ["@lsp.type.function"]      = { link = "@function"  },
    ["@lsp.type.interface"]     = { link = "Structure"  },
    ["@lsp.type.macro"]         = { link = "@macro"     },
    ["@lsp.type.method"]        = { link = "@method"    },
    ["@lsp.type.namespace"]     = { link = "@namespace" },
    ["@lsp.type.parameter"]     = { link = "@parameter" },
    ["@lsp.type.property"]      = { link = "@property"  },
    ["@lsp.type.struct"]        = { link = "Structure"  },
    ["@lsp.type.type"]          = { link = "@type"      },
    ["@lsp.type.typeParamater"] = { link = "TypeDef"    },
    ["@lsp.type.variable"]      = { link = "@variable"  },
  },
  dim_inactive = false,
  transparent_mode = true,
})

vim.o.background = 'dark'
vim.cmd("colorscheme gruvbox")

-- Setting here since doesn't work in 'overrides' property
vim.cmd('hi IlluminatedWordText  gui=underdashed')
vim.cmd('hi IlluminatedWordRead  gui=underdashed')
vim.cmd('hi IlluminatedWordWrite gui=underdashed')

