-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension  (vscode打开时加载单独的配置)
  require("config.vscode")
else
  -- ordinary Neovim   (常规打开加载LazyVim)
  require("config.lazy")
end
