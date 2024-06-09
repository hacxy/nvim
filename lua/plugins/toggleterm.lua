-- 内置终端
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-_>]],
      shade_terminals = false,
      shell = "zsh --login",
    })
  end,

  keys = {
    { [[<c-_>]] },
    -- { "<c-`>", "<Cmd>ToggleTerm<Cr>", desc = "Terminal #2" },
  },
}
