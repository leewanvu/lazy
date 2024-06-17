local M = {}

function M.find_files()
  local opts = {}
  opts.find_command = {
    "rg",
    "--files",
    "--hidden",
    "--no-ignore-vcs",
    "-g",
    "!{node_modules,.git,vendor}",
  }
  -- opts.cwd = vim.fn.expand("%:p:h")
  -- opts.previewer = false

  require("telescope.builtin").find_files(opts)
end

return M
