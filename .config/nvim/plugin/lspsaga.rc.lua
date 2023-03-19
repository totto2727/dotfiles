local ok, saga = pcall(require, "lspsaga")
if not ok then return end

saga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<M-n>',
    scroll_up = '<M-p>',
  },
  request_timeout = 2000,
}

vim.keymap.set('n', 'mr', '<Cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'mO', '<Cmd>LSoutlineToggle<Enter>')
vim.keymap.set('n', 'mF', '<Cmd>Lspsaga lsp_finder<CR>')

-- Hover Doc
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
vim.keymap.set("n", "mK", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Jumo
vim.keymap.set('n', '<C-n>', "<Cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set('n', '<C-p>', "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "mp", "<cmd>Lspsaga peek_definition<CR>")

-- Code Action
vim.keymap.set("n", "ma", function()
  vim.diagnostic.goto_next()
  vim.cmd('Lspsaga code_action')
end)
vim.keymap.set("n", "mA", function()
  vim.diagnostic.goto_prev()
  vim.cmd('Lspsaga code_action')
end)
