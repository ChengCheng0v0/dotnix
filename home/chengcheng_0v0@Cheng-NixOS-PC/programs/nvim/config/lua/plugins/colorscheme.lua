return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  { "sainnhe/gruvbox-material" },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  },
}
