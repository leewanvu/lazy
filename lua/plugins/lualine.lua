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
}
