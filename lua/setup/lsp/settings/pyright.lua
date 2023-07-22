return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'off',
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = false,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
