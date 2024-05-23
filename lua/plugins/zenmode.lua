return {
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