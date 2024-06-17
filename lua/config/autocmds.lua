-- Disable autoformat for php files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "php", "thrift" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- set tab = 2
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function(e)
    -- print(string.format(vim.inspect(e)))
    local val = 2
    vim.bo[e.buf].tabstop = val
    vim.bo[e.buf].softtabstop = val
    vim.bo[e.buf].shiftwidth = val
  end,
})
