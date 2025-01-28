return {
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      scrollbar.setup({
        throttle_ms = 0,
        handle = {
          highlight = "Visual",
        },
        marks = {
          Cursor = {
            text = "#",
            color = "#f38ba8",
          },
        },
        excluded_buftypes = {
          "nofile",
          "terminal",
        },
        excluded_filetypes = {
          "dropbar_menu",
          "dropbar_menu_fzf",
          "DressingInput",
          "cmp_docs",
          "cmp_docs",
          "cmp_menu",
          "noice",
          "notify",
          "prompt",
          "TelescopePrompt",
        },
      })
    end,
  },
}
