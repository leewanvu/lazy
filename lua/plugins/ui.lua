return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
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
    ██╗   ██╗██╗   ██╗██╗  ██╗
    ██║   ██║██║   ██║╚██╗██╔╝
    ██║   ██║██║   ██║ ╚███╔╝ 
    ╚██╗ ██╔╝██║   ██║ ██╔██╗ 
    ╚████╔╝ ╚██████╔╝██╔╝ ██╗
      ╚═══╝   ╚═════╝ ╚═╝  ╚═╝
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
}
