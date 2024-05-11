return {
  -- { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "comment", -- comments are slowing down TS bigtime, so disable for now
        "php",
        "phpdoc",
        "go",
        "css",
        "gitcommit",
        "gitignore",
        "graphql",
        "scss",
        "sql",
        "vue",
        "thrift",
      })
    end,
  },
}
