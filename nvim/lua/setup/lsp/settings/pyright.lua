return {
  settings = {
    -- pyright = {
    --   disableOrganizeImports = true,
    -- },
    python = {
      analysis = {
        -- typeCheckingMode = 'off',
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = false,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
        logLevel = "Trace"
      },
    },
    exclude = {
      ".venv",
      "**/*.cache"
    },
    venvPath = ".",
    venv = ".venv",
  },
}

