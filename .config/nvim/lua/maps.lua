local keymap = vim.keymap

keymap.set('n', '<M-s>', function() vim.cmd [[ w ]] end)
keymap.set('n', '<M-w>', function() vim.cmd [[ wq ]] end)

keymap.set('n', 'x', '"_x')
keymap.set('n', 'c', '"_c')

-- Select all
keymap.set('n', '<M-a>', 'gg<S-v>G')

-- Split Window
keymap.set('n', '<M-\\>', function()
  vim.cmd [[
  split
  wincmd w
]]
end)
keymap.set('n', '<M-|>', function()
  vim.cmd [[
  vsplit
  wincmd w
]]
end)

-- Resize window
keymap.set('n', '<M-=>', '<C-w>=')
keymap.set('n', '<M-S-<>', '<C-w><')
keymap.set('n', '<M-S->>', '<C-w>>')
keymap.set('n', '<M-S-+>', '<C-w>+')
keymap.set('n', '<M-S-->', '<C-w>-')

-- Swap Window
keymap.set('n', '<M-S-h>', '<C-w>H')
keymap.set('n', '<M-S-k>', '<C-w>K')
keymap.set('n', '<M-S-j>', '<C-w>J')
keymap.set('n', '<M-S-l>', '<C-w>L')

-- Move Window
keymap.set('n', '<M-h>', '<C-w>h')
keymap.set('n', '<M-k>', '<C-w>k')
keymap.set('n', '<M-j>', '<C-w>j')
keymap.set('n', '<M-l>', '<C-w>l')

keymap.set('i', 'jj', '<ESC>')
keymap.set({ 'n', 'v', 'i' }, '<M-q>', function() vim.cmd [[ q ]] end)
keymap.set('t', '<M-q>', '<C-\\><C-n>:q<Enter>')
