-- 配置 conform.nvim（格式化器）
-- 根据 .vscode/settings.json 动态配置格式化行为
---@diagnostic disable: undefined-global

local vscode_settings = require("config.vscode-settings")

-- 支持 ESLint 格式化的文件类型
local eslint_formattable = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
  "html",
  "json",
  "jsonc",
  "yaml",
  "markdown",
}

return {
  "stevearc/conform.nvim",
  priority = 1000, -- 确保在 LazyVim 默认配置之后执行
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    -- 如果 prettier 被禁用，使用 ESLint LSP 格式化
    if vscode_settings.should_use_eslint_format() then
      for _, ft in ipairs(eslint_formattable) do
        opts.formatters_by_ft[ft] = {} -- 设置为空表，使用 LSP 格式化
      end
    end

    return opts
  end,
}

