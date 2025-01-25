local autocmdGroup = vim.api.nvim_create_augroup("Custom auto-commands", {clear = true})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.c*", "*.h*", "*.vert", "*.geom", "*.frag"},
  desc = "clang formatter",
  callback = function ()
    local fileName = vim.api.nvim_buf_get_name(0)
    local fileFormatStyle = vim.fn.stdpath("config") .. "\\.clang-format"
    vim.cmd(":silent !clang-format -style=file:" .. fileFormatStyle .. " -i " .. fileName)
  end,
  group = autocmdGroup
})

