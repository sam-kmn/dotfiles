return {
  { "navarasu/onedark.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
  },
  -- { "typicode/bg.nvim", lazy = false },
}
