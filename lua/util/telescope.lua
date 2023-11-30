local Util = require("lazyvim.util")

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

  return Util.telescope("files", opts)
end

return M
