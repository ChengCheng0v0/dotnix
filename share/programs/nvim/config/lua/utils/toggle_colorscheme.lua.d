local wk = require("which-key")

-- 保存配色方案设置到文件的辅助函数
local function save_scheme_to_file(scheme)
  local file_path = vim.fn.expand("~/.local/state/nvim/colorscheme")
  local file = io.open(file_path, "w")
  if file then
    file:write(scheme)
    file:close()
  end
end

-- 切换配色方案的辅助函数
local function set_colorscheme(scheme)
  vim.cmd("colorscheme " .. scheme)
  save_scheme_to_file(scheme) -- 保存配色方案设置
  vim.notify("Switched colorscheme to " .. scheme, "info")
end

-- 读取配色方案设置的辅助函数
local function load_saved_scheme()
  local file_path = vim.fn.expand("~/.local/state/nvim/colorscheme")
  local file = io.open(file_path, "r")
  if file then
    local saved_scheme = file:read("*l")
    file:close()
    if saved_scheme then
      set_colorscheme(saved_scheme)
    end
  end
end

-- 加载配色方案设置
load_saved_scheme()

-- 添加键绑定
wk.add({
  -- Start group
  { "<leader>ut", group = "Toggle Colorscheme", icon = { icon = "◑", color = "purple" } },

  -- Catppuccin
  { "<leader>ut1", group = "Catppuccin", icon = "☕" },
  {
    "<leader>ut11",
    function()
      set_colorscheme("catppuccin-mocha")
    end,
    desc = "Catppuccin Mocha",
    icon = "🌿",
  },
  {
    "<leader>ut12",
    function()
      set_colorscheme("catppuccin-macchiato")
    end,
    desc = "Catppuccin Macchiato",
    icon = "🌺",
  },
  {
    "<leader>ut13",
    function()
      set_colorscheme("catppuccin-frappe")
    end,
    desc = "Catppuccin Frappe",
    icon = "🪴",
  },
  {
    "<leader>ut14",
    function()
      set_colorscheme("catppuccin-latte")
    end,
    desc = "Catppuccin Latte",
    icon = "🌻",
  },

  -- Gruvbox Material
  { "<leader>ut2", group = "Gruvbox Material", icon = "🎹" },
  {
    "<leader>ut21",
    function()
      vim.g.gruvbox_material_background = "hard"
      set_colorscheme("gruvbox-material")
    end,
    desc = "Gruvbox Material Hard",
    icon = "🪨",
  },
  {
    "<leader>ut22",
    function()
      vim.g.gruvbox_material_background = "medium"
      set_colorscheme("gruvbox-material")
    end,
    desc = "Gruvbox Material Medium",
    icon = "🪵",
  },
  {
    "<leader>ut23",
    function()
      vim.g.gruvbox_material_background = "soft"
      set_colorscheme("gruvbox-material")
    end,
    desc = "Gruvbox Material Soft",
    icon = "🍰",
  },
})
