return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({

        default_im_select = "com.apple.keylayout.ABC",
        default_command = "im-select",
        im_select = "com.apple.keylayout.ABC",
        -- Restore the default input method state when the following events are triggered
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "CmdlineEnter", "InsertEnter" },
        -- as `set_previous_events = {}`
        set_previous_events = {},
      })
    end,
  },
}
