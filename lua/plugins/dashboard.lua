return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
      ██╗  ██╗  █████╗   ██████╗ ██╗  ██╗ ██╗   ██╗
      ██║  ██║ ██╔══██╗ ██╔════╝ ╚██╗██╔╝ ╚██╗ ██╔╝
      ███████║ ███████║ ██║       ╚███╔╝   ╚████╔╝ 
      ██╔══██║ ██╔══██║ ██║       ██╔██╗    ╚██╔╝  
      ██║  ██║ ██║  ██║ ╚██████╗ ██╔╝ ██╗    ██║   
      ╚═╝  ╚═╝ ╚═╝  ╚═╝  ╚═════╝ ╚═╝  ╚═╝    ╚═╝   
    ]]

    logo = string.rep("\n", 4) .. logo .. ""

    local opts = {
      theme = "hyper",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        packages = {
          enable = false,
        },
        project = {
          enable = true,
          limit = 3,
          -- icon = "your icon",
          label = "最近项目:",
          action = "Telescope find_files cwd=",
        },
        mru = { limit = 3, label = "最近文件:", cwd_only = false },
        shortcut = {
          { desc = "󰊳 更新插件", group = "@property", action = "Lazy update", key = "u" },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "文件",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "项目列表",
            group = "DiagnosticHint",
            action = "Telescope projects",
            key = "p",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "Telescope dotfiles",
            key = "d",
          },
        },
        header = vim.split(logo, "\n"),
        week_header = {
          enable = false,
          concat = "",
          append = {
            "",
          },
        },
        -- stylua: ignore
        center = {
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "",
            "了解真相才能获得真正的自由",
            "⚡ Neovim 已加载 " .. stats.loaded .. "/" .. stats.count .. " 插件加载耗时 " .. ms .. "ms",
          }
        end,
      },
    }

    -- for _, button in ipairs(opts.config.center) do
    --   button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    --   button.key_format = "  %s"
    -- end

    -- open dashboard after closing lazy

    -- if vim.o.filetype == "lazy" then
    --   vim.api.nvim_create_autocmd("WinClosed", {
    --     pattern = tostring(vim.api.nvim_get_current_win()),
    --     once = true,
    --     callback = function()
    --       vim.schedule(function()
    --         vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
    --       end)
    --     end,
    --   })
    -- end

    return opts
  end,
}
