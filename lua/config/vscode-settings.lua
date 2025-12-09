-- 读取并解析 .vscode/settings.json
---@diagnostic disable: undefined-global
local M = {}

-- 获取项目根目录（优先使用当前缓冲区路径）
local function get_root()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local path = (buf_path ~= "") and vim.fs.dirname(buf_path) or vim.fn.getcwd()
  local root = vim.fs.find({ ".git", ".vscode" }, { path = path, upward = true })[1]
  return root and vim.fs.dirname(root) or path
end

-- 读取并解析 JSON 文件
local function read_json_file(filepath)
  local ok, file = pcall(vim.fn.readfile, filepath)
  if not ok or not file then
    return nil
  end

  -- 移除注释行
  local cleaned = {}
  for _, line in ipairs(file) do
    -- 移除单行注释（// 开头的注释）
    local cleaned_line = line:gsub("//.*", "")
    if cleaned_line:match("%S") then -- 只添加非空行
      table.insert(cleaned, cleaned_line)
    end
  end

  local content = table.concat(cleaned, "\n")
  local ok_json, json = pcall(vim.json.decode, content)
  if not ok_json then
    return nil
  end
  return json
end

-- 获取 VSCode 设置
function M.get_settings()
  local root = get_root()
  local settings_path = vim.fs.joinpath(root, ".vscode", "settings.json")
  local settings = read_json_file(settings_path)
  return settings or {}
end

-- 检查是否应该使用 ESLint 格式化
function M.should_use_eslint_format()
  return M.get_settings()["prettier.enable"] == false
end

-- 获取 ESLint 验证的语言列表
function M.get_eslint_validate_languages()
  local settings = M.get_settings()
  local validate = settings["eslint.validate"]
  if type(validate) == "table" then
    return validate
  end
  return {}
end

-- 检查是否应该自动修复 ESLint
function M.should_fix_eslint_on_save()
  local actions = M.get_settings()["editor.codeActionsOnSave"] or {}
  return actions["source.fixAll.eslint"] == "explicit"
end

return M

