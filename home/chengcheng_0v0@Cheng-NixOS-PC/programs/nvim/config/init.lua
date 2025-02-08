-- 如果存在 __NIX_LD_PATH 则设置 NIX_LD 环境变量
-- 这么做是为了让 Mason 等依赖标准 FHS 的功能能够正常使用
if vim.env.__NIX_LD_PATH then
  vim.env.NIX_LD = vim.env.__NIX_LD_PATH
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--------------------

-- 加载 Utils
for _, file in ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/lua/utils/*.lua", true, true)) do
  require("utils." .. file:match("([^/]+)%.lua$"))
end

-- 加载 AutoCmd
for _, file in ipairs(vim.fn.glob(vim.fn.stdpath("config") .. "/lua/autocmds/*.lua", true, true)) do
  require("autocmds." .. file:match("([^/]+)%.lua$"))
end
