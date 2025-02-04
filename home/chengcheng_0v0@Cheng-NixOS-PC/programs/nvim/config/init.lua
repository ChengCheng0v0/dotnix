-- 如果在 NixOS 上则设置 NIX_LD 环境变量
if vim.loop.os_uname().sysname == "Linux" and vim.fn.filereadable("/etc/NIXOS") == 1 then
  local handle = io.popen(
    "nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents \"${pkgs.stdenv.cc}/nix-support/dynamic-linker\"; in NIX_LD'"
  )
  if handle then
    local nix_ld = handle:read("*a")
    handle:close()
    nix_ld = nix_ld:gsub("%s+", "") -- 去除可能的换行符
    vim.env.NIX_LD = nix_ld
  end
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
