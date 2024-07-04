if vim.g.vscode then return end

local ok, colorizer = pcall(require, "colorizer")
if not ok then return end

colorizer.setup()
