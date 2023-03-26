local ok, saga = pcall(require, "lspsaga")
if not ok then return end

saga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
  request_timeout = 2000,
}

vim.keymap.set('n', 'mr', '<Cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'mO', '<Cmd>Lspsaga outline<Enter>')
vim.keymap.set('n', 'mlf', '<Cmd>Lspsaga lsp_finder<CR>')

-- Hover Doc
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
vim.keymap.set("n", "mk", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Jumo
vim.keymap.set('n', '<C-n>', "<Cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set('n', '<C-S-n>', "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "mp", "<cmd>Lspsaga peek_definition<CR>")

-- Code Action
vim.keymap.set("n", "<C-c>", function()
  vim.diagnostic.goto_next()
  vim.cmd('Lspsaga code_action')
end)
vim.keymap.set("n", "<C-S-c>", function()
  vim.diagnostic.goto_prev()
  vim.cmd('Lspsaga code_action')
end)
