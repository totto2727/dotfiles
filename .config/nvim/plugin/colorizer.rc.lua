local ok, colorizer = pcall(require, "colorizer")
if not ok then return end

if vim.g.vscode then
  return
end

colorizer.setup()
