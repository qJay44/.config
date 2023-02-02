local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return vim.notify('null-ls', 'error', { title = 'Plugin call fail' })
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ extra_args = { '--no-sime', '--single-quote', '--jsx-single-quote' }}),
    formatting.black.with({ extra_args = { '--fast' }}),
    formatting.stylua
  }
})
