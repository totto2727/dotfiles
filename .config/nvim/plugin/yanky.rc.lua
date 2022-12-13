local ok1, yanky = pcall(require, "yanky")
local ok2, utils = pcall(require, "yanky.utils")
local ok3, telescope = pcall(require, "telescope")

if not (ok1 and ok2 and ok3) then return end

local mapping = require("yanky.telescope.mapping")

yanky.setup({
  picker = {
    telescope = {
      mappings = {
        default = mapping.put("r"),
        n = {
          p = mapping.put("p"),
          P = mapping.put("P"),
          r = mapping.set_register(utils.get_default_register())
        },
      }
    }
  }
})

vim.keymap.set('n', '<Space>y', ':Telescope yank_history<Enter>')
vim.keymap.set('n', 'myc', ':YankyClearHistory<Enter>')

telescope.load_extension('yank_history')
