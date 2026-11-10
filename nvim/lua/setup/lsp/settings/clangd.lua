return {
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders=1",
    "--compile-commands-dir=./Build"
  },
}

