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
