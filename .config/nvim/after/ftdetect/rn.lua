vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.rn" },
  callback = function()
    vim.cmd("set ft=rune")
  end,
})

-- autocmd BufNewFile,BufRead *.Rhtml set filetype=html
