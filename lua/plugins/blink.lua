return {
  "saghen/blink.cmp",
  -- 移除 friendly-snippets 依赖
  -- 明确指定不包含任何依赖，覆盖默认的 friendly-snippets 依赖
  dependencies = {},
  opts = {
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-D>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-P>"] = { "scroll_documentation_up", "fallback" },
      ["<C-N>"] = { "scroll_documentation_down", "fallback" },
    },
    cmdline = {
      keymap = {
        ["<C-j>"] = { "show_and_insert_or_accept_single", "select_next" },
        ["<C-k>"] = { "show_and_insert_or_accept_single", "select_prev" },
      },
    },
  },
}
