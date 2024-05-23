return {
  -- floating statuslines
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- local colors = require("tokyonight.colors").setup()

      require("incline").setup({
        hide = {
          only_win = true,
        },
        -- highlight = {
        --   groups = {
        --     InclineNormal = { guibg = colors.blue, guifg = colors.black },
        --     InclineNormalNC = { guifg = colors.blue, guibg = colors.black },
        --   },
        -- },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          -- local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { "---♥ --> " },
            -- { icon, guifg = color },
            -- { " " },
            { filename },
          }
        end,
      })
    end,
  },
}
