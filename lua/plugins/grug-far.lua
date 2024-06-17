return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>z", "<cmd>GrugFar<cr>", desc = "GrugFar" },
    },
    config = function()
      require("grug-far").setup({})
    end,
  },
}
