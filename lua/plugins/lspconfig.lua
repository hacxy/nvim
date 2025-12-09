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
    },
  },
}
