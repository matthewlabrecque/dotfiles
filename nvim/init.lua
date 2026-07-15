  -- Add neovim packages
  vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/m4xshen/autoclose.nvim',
    'https://github.com/vyfor/cord.nvim',
    'https://github.com/YousefHadder/markdown-plus.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/chomosuke/typst-preview.nvim'
  })

  -- Enable colorscheme
  vim.cmd.colorscheme('kanagawa')

  -- Enable LSPs
  vim.lsp.enable("gopls")
  vim.lsp.enable("rust-analyzer")
  vim.lsp.enable("pyright-langserver", "--stdio")

  -- Custom Keybinds
  vim.keymap.set('n', '<bs>', ':edit #<cr>', { silent = true })

  -- Additional customization
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.smartcase = true
  vim.opt.tabstop = 4
  vim.opt.swapfile = false
  vim.opt.smoothscroll = true
  vim.opt.termguicolors = true
  vim.opt.linebreak = true
  vim.opt.breakindent = true
  vim.opt.textwidth = 80
  vim.opt.colorcolumn = "80"
  vim.opt.showmode = false
  vim.opt.showcmd = false

  -- Setup
  require("oil").setup()
  require('lualine').setup()
  require('cord').setup()
  require("autoclose").setup()
  require('mini.starter').setup()
  require('typst-preview').setup()
