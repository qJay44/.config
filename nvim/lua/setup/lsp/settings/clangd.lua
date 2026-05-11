return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    -- "--header-insertion=never",
    "--completion-style=detailed",
    "--function-arg-placeholders=1",
    "--compile-commands-dir=./Build"
  },
}

