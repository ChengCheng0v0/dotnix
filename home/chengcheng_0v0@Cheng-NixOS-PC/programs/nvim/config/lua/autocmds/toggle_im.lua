-- 是否自动恢复插入模式下的输入法状态
local auto_recover_input_method_status = false
-- 记录插入模式下的输入法状态
local input_method_status = 1

-- 获取当前输入法状态的辅助函数
local function get_input_method_status()
  return tonumber(vim.fn.system("fcitx5-remote")) or 1
end

-- 切换输入法的辅助函数
local function set_input_method_status(status)
  if vim.fn.executable("fcitx5-remote") == 1 then
    os.execute("fcitx5-remote " .. (status == 2 and "-o" or "-c"))
  end
end

-- 自动切换输入法
local function toggle_input_method(mode)
  if mode == "insert" then
    -- 如果启用自动恢复则在进入插入模式时恢复之前保存的状态
    if auto_recover_input_method_status then
      set_input_method_status(input_method_status)
    else
      -- 否则切换到英文输入法
      set_input_method_status(1)
    end
  else
    -- 离开插入模式时记录当前状态
    input_method_status = get_input_method_status()
    set_input_method_status(1) -- 切换到英文
  end
end

-- 进入插入模式时切换输入法
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    toggle_input_method("insert")
  end,
})

-- 退出插入模式时切换输入法
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    toggle_input_method("normal")
  end,
})

-- 退出命令模式时切换输入法
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    toggle_input_method("normal")
  end,
})
