return {
  {
    "L3MON4D3/LuaSnip",
    -- keys = function()
    --   -- Disable default tab keybinding in LuaSnip
    --   return {}
    -- end,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets" }, -- 这里引入自己的代码片段
      })
    end,
  },
}
