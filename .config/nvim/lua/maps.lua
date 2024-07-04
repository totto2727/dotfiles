-- 1文字単位のコピーを無効化
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 's', '"_s')

vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')
-- vim.keymap.set('n', '<Leader>o', 'o<ESC>')
vim.keymap.set('n', '<Leader>o', ":<C-u>call append(expand('.'), '')<Cr>j")

-- Select all
vim.keymap.set('n', '<Leader>a', 'ggVG')

-- Split Window
vim.keymap.set('n', '<Leader>s', function()
  vim.cmd [[
  split
  wincmd w
]]
end)
vim.keymap.set('n', '<Leader>v', function()
  vim.cmd [[
  vsplit
  wincmd w
]]
end)

-- Move Window
vim.keymap.set('n', '<Leader><Leader>', '<C-w>w')
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

-- VSCodeと実用するための暫定的な設定
vim.keymap.set('n', '<M-Space>', '<C-w>w')
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-l>', '<C-w>l')

-- ESC
vim.keymap.set('t', 'gf', '<c-\\><c-n>')
vim.keymap.set('i', 'gf', '<ESC>')

-- terminal
vim.keymap.set('n', '<Leader>t', ':T<Cr>')
vim.keymap.set('n', '<Leader>T', ':terminal<Cr>')
