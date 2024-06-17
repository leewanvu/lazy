local Util = require("util.telescope")

return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } },
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
      -- {
      --   "nvim-telescope/telescope-file-browser.nvim",
      -- },
    },
    keys = {
      { "<leader>ff", Util.find_files, desc = "Find Files (root dir)" },
      { "<leader><space>", Util.find_files, desc = "Find Files (root dir)" },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fl",
        function()
          local files = {} ---@type table<string, string>
          for _, plugin in pairs(require("lazy.core.config").plugins) do
            repeat
              if plugin._.module then
                local info = vim.loader.find(plugin._.module)[1]
                if info then
                  files[info.modpath] = info.modpath
                end
              end
              plugin = plugin._.super
            until not plugin
          end
          require("telescope.builtin").live_grep({
            default_text = "/",
            search_dirs = vim.tbl_values(files),
          })
        end,
        desc = "Find Lazy Plugin Spec",
      },
      -- {
      --   "<leader>fe",
      --   function()
      --     local telescope = require("telescope")
      --
      --     local function telescope_buffer_dir()
      --       return vim.fn.expand("%:p:h")
      --     end
      --
      --     telescope.extensions.file_browser.file_browser({
      --       path = "%:p:h",
      --       cwd = telescope_buffer_dir(),
      --       respect_gitignore = false,
      --       hidden = true,
      --       grouped = true,
      --       previewer = false,
      --       initial_mode = "insert",
      --       -- layout_config = { height = 40 },
      --     })
      --   end,
      --   desc = "File Browser (cwd)",
      -- },
      -- { "<leader>e", "<leader>fe", desc = "Explorer (cwd)", remap = true },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        preview = {
          filesize_limit = 0.1, -- MB
        },
        sorting_strategy = "ascending",
        winblend = 0,
        selection_caret = " ",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            -- ["<C-f>"] = actions.preview_scrolling_down,
            -- ["<C-b>"] = actions.preview_scrolling_up,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      })

      -- opts.extensions = {
      --   file_browser = {
      --     -- theme = "dropdown",
      --     -- previewer = false,
      --     -- disables netrw and use telescope-file-browser in its place
      --     hijack_netrw = true,
      --   },
      -- }

      telescope.setup(opts)
      -- require("telescope").load_extension("file_browser")
    end,
  },
}
