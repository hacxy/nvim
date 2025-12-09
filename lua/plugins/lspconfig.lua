local vscode_settings = require("config.vscode-settings")

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
        settings = {
          codeActionOnSave = {
            enable = vscode_settings.should_fix_eslint_on_save(),
            mode = "all",
          },
          format = vscode_settings.should_use_eslint_format(),
          validate = "on",
          onIgnoredFiles = "off",
        },
      },
    },
  },
}
