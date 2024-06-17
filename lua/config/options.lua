vim.scriptencoding = "utf-8"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.shell = "fish"
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- lovely statusline
opt.laststatus = 3
opt.statusline = " %f %m %= %l:%c ♥ "
