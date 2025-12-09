---配置 nvim-lspconfig
---LSP 服务器配置
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html_lsp = {},
      css_lsp = {},
      stylelint_lsp = {
        settings = {
          stylelintplus = {
            autoFixOnSave = true,
            autoFixOnFormat = true,
            validateOnSave = true,
          },
        },
      },
      eslint = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
          "html",
          "markdown",
          "json",
          "jsonc",
          "yaml",
          "toml",
          "xml",
          "gql",
          "graphql",
          "astro",
          "svelte",
          "css",
          "less",
          "scss",
          "pcss",
          "postcss",
        },
        settings = {
          -- 静默样式规则在 IDE 中的显示，但仍自动修复它们
          rulesCustomizations = {
            { rule = "style/*", severity = "on", fixable = true },
            { rule = "format/*", severity = "on", fixable = true },
            { rule = "*-indent", severity = "on", fixable = true },
            { rule = "*-spacing", severity = "on", fixable = true },
            { rule = "*-spaces", severity = "on", fixable = true },
            { rule = "*-order", severity = "on", fixable = true },
            { rule = "*-dangle", severity = "on", fixable = true },
            { rule = "*-newline", severity = "on", fixable = true },
            { rule = "*quotes", severity = "on", fixable = true },
            { rule = "*semi", severity = "on", fixable = true },
          },
        },
      },
    },
  },
}
