local ok, gitsigns = pcall(require, "gitsigns")
if (not ok) then return end

gitsigns.setup({
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
})
