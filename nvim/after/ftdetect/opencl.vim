au BufNewFile,BufRead *.cl     set filetype=c | lua vim.diagnostic.enable(false, {bufnr=0})
