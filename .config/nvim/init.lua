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
local is_win = has "win32"

if is_mac then
  require('macos')
end

if is_linux then
  require("linux")
end

if is_win then
  require('windows')
end

-- vim.cmd [[
-- function! ProfileCursorMove() abort
--   let profile_file = expand('~/log/vim-profile.log')
--   if filereadable(profile_file)
--     call delete(profile_file)
--   endif
--
--   normal! gg
--   normal! zR
--
--   execute 'profile start ' . profile_file
--   profile func *
--   profile file *
--
--   augroup ProfileCursorMove
--     autocmd!
--     autocmd CursorHold <buffer> profile pause | q
--   augroup END
--
--   for i in range(100)
--     call feedkeys('j')
--     " call feedkeys('<Down>')
--   endfor
-- endfunction
-- ]]
