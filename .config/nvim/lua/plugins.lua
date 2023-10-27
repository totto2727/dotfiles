local ok, packer = pcall(require, "packer")
if not ok then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

vim.g.loaded_matchparen = 1

packer.startup(function(use)
  -- Package Manager
  use 'wbthomason/packer.nvim'
  use 'vim-denops/denops.vim'
  -- Appearance
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'
  ---- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'HiPhish/nvim-ts-rainbow2'
  use "windwp/nvim-autopairs"
  use 'windwp/nvim-ts-autotag'
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Filer
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Tool
  use 'monaqa/dial.nvim'
  use 'tpope/vim-surround'
  use 'monkoose/matchparen.nvim'
  use 'c60cb859/bufMov.nvim'
end)
