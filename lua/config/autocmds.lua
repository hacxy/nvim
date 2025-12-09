-- 自动命令（Autocmds）会在 VeryLazy 事件时自动加载
-- 默认的自动命令总是会被设置：https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- 在此处添加任何额外的自动命令
local vscode_settings = require("config.vscode-settings")

-- 测试命令：检查 VSCode 设置配置
vim.api.nvim_create_user_command("CheckVSCodeSettings", function()
  local conform = require("conform")
  local settings = vscode_settings.get_settings()
  local use_eslint_format = vscode_settings.should_use_eslint_format()
  local current_ft = vim.bo.filetype
  local formatters = (conform and conform.formatters_by_ft and conform.formatters_by_ft[current_ft]) or {}
  vim.notify(
    string.format(
      "prettier.enable: %s\nuse_eslint_format: %s\ncurrent filetype: %s\nformatters: %s",
      tostring(settings["prettier.enable"]),
      tostring(use_eslint_format),
      current_ft,
      vim.inspect(formatters)
    ),
    vim.log.levels.INFO
  )
end, { desc = "检查 VSCode 设置配置" })
