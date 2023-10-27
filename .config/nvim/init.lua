local ok1, _ = pcall(require, 'base')
local ok2, _ = pcall(require, 'highlights')
local ok3, _ = pcall(require, 'maps')
local ok4, _ = pcall(require, 'plugins')

if not (ok1 and ok2 and ok3 and ok4) then return end

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_linux = has "linux"

if is_mac then
  vim.opt.clipboard:append { 'unnamedplus' }
end

if is_linux then
  vim.opt.clipboard:append { 'unnamedplus' }
end
