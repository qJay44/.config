return {
  settings = {
    -- pyright = {
    --   disableOrganizeImports = true,
    -- },
    python = {
      analysis = {
        -- typeCheckingMode = 'off',
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = false,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
  -- root_dir = function()
  --   return vim.fn.getcwd()
  -- end,
}

