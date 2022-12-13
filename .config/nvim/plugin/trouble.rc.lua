local ok, trouble = pcall(require, "trouble")
if not (ok) then return end

trouble.setup()

-- vim.keymap.set('n', '<Space>d', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<Space>d', '<cmd>TroubleToggle workspace_diagnostics<cr>')
