local ok, bufMov = pcall(require, "bufMov")
if not (ok) then return end

vim.keymap.set("n", "<C-S-j>", function() bufMov.movBuf('down') end)
vim.keymap.set("n", "<C-S-k>", function() bufMov.movBuf('up') end)
vim.keymap.set("n", "<C-S-h>", function() bufMov.movBuf('left') end)
vim.keymap.set("n", "<C-S-l>", function() bufMov.movBuf('right') end)
