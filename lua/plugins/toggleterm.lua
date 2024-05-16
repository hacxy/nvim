-- 内置终端
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-`>]],
      shade_terminals = false,
      shell = "zsh --login",
    })
  end,

  keys = {
    { [[<c-`>]] },
    { "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
  },
}
