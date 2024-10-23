local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- 自动切换输入法
-- autocmd("InsertLeave", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").macInsertLeave,
-- })
-- autocmd("InsertEnter", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").macInsertEnter,
-- })

-- 关闭默认的单词校验
vim.api.nvim_create_autocmd("FileType", {
  group = "lazyvim_wrap_spell",
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.spell = false
  end,
})

-- json 以及 markdown 文件不隐藏双引号
autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- 设置选中的文本和背景色

vim.cmd([[
  highlight Visual guifg=#FFC0CB guibg=#778899
]])
