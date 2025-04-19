require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    comments = true,
    operators = false,
    folds = true,
    emphasis = false
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
    Normal                  = { bg   = '#1d2021'              },
    NormalFloat             = { link = 'Normal',              },
    FloatBorder             = { bg   = '#1d2021', blend = 100 },
    CmpItemKindFunction     = { link = 'GruvboxGreen'         },
    CmpItemKindMethod       = { link = 'GruvboxGreen'         },
    CmpItemKindText         = { link = "GruvboxFg0"           },
    CmpItemKindField        = { link = 'GruvboxOrange'        },
    CmpItemKindVariable     = { link = "GruvboxBlue"          },
    NavicIconsFunction      = { link = 'GruvboxGreen'         },
    NavicIconsMethod        = { link = 'GruvboxGreen'         },
    NavicIconsConstructor   = { link = "GruvboxYellow"        },
    Pmenu                   = { link = 'GruvboxFg4'           },
    PmenuSel                = { link = 'CursorLine'           },
    TelescopeSelectionCaret = { link = 'GruvboxFg0'           },
    TelescopePromptPrefix   = { link = 'GruvboxFg0'           },
    TelescopeResultsBorder  = { link = 'FloatBorder'          },
    TelescopePreviewBorder  = { link = 'FloatBorder'          },
    TelescopePromptBorder   = { link = 'FloatBorder'          },
    TelescopeBorder         = { link = 'FloatBorder'          },
    GitSignsChange          = { link = 'GruvBoxYellow'        },
    FocusedSymbol           = { link = 'CursorLine'           },
    Directory               = { link = 'GruvboxBlue'          },

    -- Treesitter
    ['@variable']         = { link = 'GruvboxBlue'   },
    ['@string']           = { link = 'GruvboxAqua'   },
    ['@include']          = { link = 'GruvboxRed'    },
    ['@type.qualifier']   = { link = 'GruvboxRed'    },
    ['@type.builtin']     = { link = 'GruvboxRed'    },
    ['@variable.builtin'] = { link = 'GruvboxOrange' },
    ['@namespace']        = { link = 'GruvboxAqua'   },
    ['@text.todo']        = { link = 'GruvboxOrange' },
    ['@text.danger']      = { link = 'GruvboxRed'    },

    -- Git signs
    ['NvimTreeGitDirty']       = { link = 'GruvboxYellow' },
    ['NvimTreeGitNew']         = { link = 'GruvboxAqua'   },
    ['NvimTreeGitDirtyIcon']   = { link = 'GruvboxYellow' },

    -- LSP semantics to match Treesitter
    ["@lsp.type.class"]         = { link = "@type"         },
    ["@lsp.type.decorator"]     = { link = "Function"      },
    ["@lsp.type.enum"]          = { link = "Type"          },
    ["@lsp.type.enumMember"]    = { link = "Constant"      },
    ["@lsp.type.function"]      = { link = "@function"     },
    ["@lsp.type.interface"]     = { link = "Structure"     },
    ["@lsp.type.macro"]         = { link = "@constant"     },
    ["@lsp.type.method"]        = { link = "@method"       },
    ["@lsp.type.namespace"]     = { link = "@namespace"    },
    ["@lsp.type.parameter"]     = { link = "@parameter"    },
    ["@lsp.type.property"]      = { link = "@property"     },
    ["@lsp.type.struct"]        = { link = "Structure"     },
    ["@lsp.type.type"]          = { link = "@type"         },
    ["@lsp.type.type.builtint"] = { link = "@type.builtin" },
    ["@lsp.type.typeParamater"] = { link = "TypeDef"       },
    ["@lsp.type.variable"]      = { link = "@variable"     },
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

