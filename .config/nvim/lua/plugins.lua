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
  use "lukas-reineke/indent-blankline.nvim"
  use "levouh/tint.nvim"
  ---- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  -- use "windwp/nvim-autopairs"
  use 'windwp/nvim-ts-autotag'
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'jayp0521/mason-null-ls.nvim'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'dcampos/nvim-snippy'
  ---- UI
  use 'glepnir/lspsaga.nvim'
  use "folke/trouble.nvim"
  ---- Typescript
  use "jose-elias-alvarez/typescript.nvim"
  ---- Go
  use 'mattn/vim-goimports'
  ---- F#
  use { 'ionide/Ionide-vim' }
  -- Completion
  use 'Shougo/ddc.vim'
  use 'Shougo/pum.vim'
  use 'Shougo/ddc-ui-pum'
  use 'matsui54/denops-popup-preview.vim'
  use 'matsui54/denops-signature_help'
  use 'tani/ddc-fuzzy'
  use 'Shougo/ddc-source-nvim-lsp'
  use 'matsui54/ddc-buffer'
  use 'LumaKernel/ddc-source-file'
  use 'totto2727/ddc-snippy'
  -- Filer
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'camgraff/telescope-tmux.nvim'
  use 'nvim-telescope/telescope-ghq.nvim'
  use "gbprod/yanky.nvim"
  -- Tool
  use 'tpope/vim-surround'
  use "windwp/nvim-autopairs"
  use 'monkoose/matchparen.nvim'
  use 'c60cb859/bufMov.nvim'
end)
