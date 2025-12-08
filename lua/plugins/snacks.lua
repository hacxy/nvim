-- snacks.nvim 插件配置
-- 这是一个文件选择器插件，提供快速的文件导航功能
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    -- 选择器配置
    picker = {
      -- 数据源配置
      sources = {
        -- 文件浏览器配置
        explorer = {
          auto_close = true, -- 选择文件后自动关闭浏览器
        },
      },
    },
  },
}
