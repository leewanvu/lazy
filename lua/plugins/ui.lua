return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
      },
    },
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██╗   ██╗██╗   ██╗██╗  ██╗██╗  ██╗██╗  ██╗
██║   ██║██║   ██║╚██╗██╔╝╚██╗██╔╝╚██╗██╔╝
██║   ██║██║   ██║ ╚███╔╝  ╚███╔╝  ╚███╔╝ 
╚██╗ ██╔╝██║   ██║ ██╔██╗  ██╔██╗  ██╔██╗ 
 ╚████╔╝ ╚██████╔╝██╔╝ ██╗██╔╝ ██╗██╔╝ ██╗
  ╚═══╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      -- stylua: ignore
      opts.config.center = {
        { action = [[lua require("util.telescope").find_files()()]],           desc = " Find file",       icon = " ", key = "f" },
        { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
        { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
        { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
        { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
        { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
        { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
        { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
        { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
      }
      -- align center
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- disable animation
        animation = function()
          return 0
        end,
      },
    },
  },
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

  -- zenmod
  -- "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    enabled = false,
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
