local M = {}
---@type table<string, table<string, string[]>>
M.dials_by_ft = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = M.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  -- {
  --   "monaqa/dial.nvim",
  --   keys = {
  --     {
  --       "<C-->",
  --       function()
  --         return M.dial(true)
  --       end,
  --       expr = true,
  --       desc = "Increment",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<C-=>",
  --       function()
  --         return M.dial(false)
  --       end,
  --       expr = true,
  --       desc = "Decrement",
  --       mode = { "n", "v" },
  --     },
  --   },
  -- },
}
