---配置 conform.nvim（格式化器）
---根据项目根目录下是否存在 prettier 配置动态配置格式化行为
---用于兼容 antfu eslint config（不使用 prettier）和使用 prettier 的项目
local prettier_detector = require("config.prettier-detector")

---支持 ESLint 格式化的文件类型
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

    -- 如果项目根目录下没有 prettier 配置，禁用 prettier 格式化器，使用 ESLint LSP 格式化
    -- 兼容 antfu eslint config（不使用 prettier 的项目）
    -- 如果有 prettier 配置，则使用 prettier 格式化（LazyVim 默认行为）
    if not prettier_detector.has_prettier_config(0) then
      for _, ft in ipairs(eslint_formattable) do
        -- 设置为空表，禁用 prettier，使用 LSP（ESLint）格式化
        opts.formatters_by_ft[ft] = {}
      end
    end

    return opts
  end,
}
