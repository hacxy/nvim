-- 获取 lazy.nvim 的安装路径
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 如果 lazy.nvim 不存在，则从 GitHub 克隆
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- 如果克隆失败，显示错误信息并退出
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- 将 lazy.nvim 添加到运行时路径的最前面
vim.opt.rtp:prepend(lazypath)

-- 配置 lazy.nvim 插件管理器
require("lazy").setup({
  spec = {
    -- 添加 LazyVim 并导入其插件
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- 导入/覆盖你的自定义插件
    { import = "plugins" },
  },
  defaults = {
    -- 默认情况下，只有 LazyVim 插件会被延迟加载。你的自定义插件会在启动时加载。
    -- 如果你知道自己在做什么，可以将此设置为 `true`，让所有自定义插件默认延迟加载。
    lazy = false,
    -- 建议暂时保持 version=false，因为很多支持版本控制的插件
    -- 都有过时的发布版本，可能会破坏你的 Neovim 安装。
    version = false, -- 始终使用最新的 git 提交
    -- version = "*", -- 尝试为支持语义化版本的插件安装最新的稳定版本
  },
  -- 安装配置：指定安装时使用的颜色主题
  install = { colorscheme = { "tokyonight", "habamax" } },
  -- 检查器配置：自动检查插件更新
  checker = {
    enabled = true, -- 定期检查插件更新
    notify = false, -- 更新时不通知
  },
  -- 性能优化配置
  performance = {
    rtp = {
      -- 禁用一些运行时路径（rtp）插件以提升性能
      disabled_plugins = {
        "gzip", -- 禁用 gzip 插件
        -- "matchit", -- 匹配括号插件（已注释，表示启用）
        -- "matchparen", -- 匹配括号插件（已注释，表示启用）
        -- "netrwPlugin", -- 文件浏览器插件（已注释，表示启用）
        "tarPlugin", -- 禁用 tar 插件
        "tohtml", -- 禁用 HTML 转换插件
        "tutor", -- 禁用教程插件
        "zipPlugin", -- 禁用 zip 插件
      },
    },
  },
})
