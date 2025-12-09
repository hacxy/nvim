-- 配置 nvim-lint（Linter）
-- 注意：ESLint 通过 LSP 处理，不需要在 nvim-lint 中配置

return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}
    -- ESLint 通过 ESLint LSP 服务器处理
    -- 这里只处理其他类型的 linter（如 stylelint, jsonlint 等）
    return opts
  end,
}
