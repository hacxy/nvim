---@diagnostic disable: undefined-global
---Prettier 配置检测模块
---用于兼容 antfu eslint config（不使用 prettier）和使用 prettier 的项目
local M = {}

---检测项目根目录下是否存在 prettier 配置文件
---@param bufnr? number 缓冲区编号，默认为当前缓冲区
---@return boolean 如果存在 prettier 配置则返回 true，否则返回 false
function M.has_prettier_config(bufnr)
  bufnr = bufnr or 0
  local buf_path = vim.api.nvim_buf_get_name(bufnr)
  local path = (buf_path ~= "" and buf_path ~= "[No Name]") and vim.fs.dirname(buf_path) or vim.fn.getcwd()

  -- 查找项目根目录（通过 .git 或 package.json）
  local root = vim.fs.find({ ".git", "package.json" }, { path = path, upward = true })[1]
  root = root and vim.fs.dirname(root) or path

  -- Prettier 配置文件列表
  local prettier_configs = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.js",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.mjs",
    ".prettierrc.mjs",
  }

  -- 检查是否存在 prettier 配置文件
  for _, config in ipairs(prettier_configs) do
    local config_path = vim.fs.joinpath(root, config)
    if vim.fn.filereadable(config_path) == 1 then
      return true
    end
  end

  -- 检查 package.json 中是否有 prettier 配置
  local package_json_path = vim.fs.joinpath(root, "package.json")
  if vim.fn.filereadable(package_json_path) == 1 then
    local ok, content = pcall(vim.fn.readfile, package_json_path)
    if ok and content then
      local json_content = table.concat(content, "\n")
      local ok_json, package_json = pcall(vim.json.decode, json_content)
      if ok_json and package_json and package_json.prettier then
        return true
      end
    end
  end

  return false
end

return M
