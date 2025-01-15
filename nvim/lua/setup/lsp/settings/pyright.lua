return {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = {'*'},
        -- typeCheckingMode = 'off',
        -- diagnosticMode = 'workspace',
        -- useLibraryCodeForTypes = false,
        -- inlayHints = {
        --   variableTypes = true,
        --   functionReturnTypes = true,
        -- },
      },
    },
  },
}

