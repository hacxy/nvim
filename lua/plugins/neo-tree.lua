return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = false,
      statusline = true,
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          ".git",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".vitepress",
          ".env",
          ".env.*",
        },

        -- always_show_by_pattern = { -- uses glob style patterns
        --   ".env",
        -- },

        -- hide_by_name = {
        --   ".git",
        -- },
      },
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      async_directory_scan = "always",
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
      width = 30,
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
