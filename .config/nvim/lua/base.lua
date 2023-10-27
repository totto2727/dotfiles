vim.cmd [[
autocmd!
]]

-- encord
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.shell = vim.env.SHELL
vim.opt.title = true

-- 行番号
vim.wo.number = true

-- Indent&Tab
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = false
vim.opt.breakindent = true

-- Backup
vim.opt.backup = false
vim.cmd [[
" カーソル位置記憶
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
]]

-- Status Line&Command Line
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'

vim.opt.scrolloff = 40
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '.git' }

vim.opt.formatoptions:append { 'ro' }

