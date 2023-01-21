local ok, telescope = pcall(require, "telescope")
if not ok then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    initial_mode = 'normal',
    layout_config = {
      prompt_position = 'bottom'
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ['l'] = actions.select_default
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      initial_mode = 'insert'
    },
    live_grep = {
      initial_mode = 'insert'
    },
    keymaps = {
      initial_mode = 'insert'
    },
    current_buffer_fuzzy_find = {
      initial_mode = 'insert'
    },
  },
  extensions = {
    file_browser = {
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      hide_parent_dir = true,
      grouped = true,
      hijack_netrw = true,
      mappings = {
        ["i"] = {},
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ['H'] = fb_actions.toggle_hidden,
        },
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    }
  },
}


telescope.load_extension("file_browser")
telescope.load_extension('fzf')
telescope.load_extension('ghq')

vim.keymap.set('n', '<Space>ff', builtin.find_files)
vim.keymap.set('n', '<Space>fg', builtin.live_grep)
vim.keymap.set('n', '<Space>b', builtin.buffers)
vim.keymap.set('n', '<Space>r', builtin.lsp_references)
vim.keymap.set('n', '<Space>d', builtin.lsp_definitions)
vim.keymap.set('n', '<Space>t', builtin.lsp_type_definitions)
vim.keymap.set('n', '<Space>i', builtin.lsp_implementations)
vim.keymap.set('n', '<Space>gs', builtin.git_status)
vim.keymap.set('n', '<Space>gc', builtin.git_commits)
vim.keymap.set('n', '<Space>gbc', builtin.git_bcommits)
vim.keymap.set('n', '<Space>gb', builtin.git_branches)
vim.keymap.set('n', '<Space>fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<Space>ghq', ":Telescope ghq list<Enter>")
vim.keymap.set('n', '<Space>s', ":Telescope tmux sessions<Enter>")
vim.keymap.set('n', '<Space>w', ":Telescope tmux windows<Enter>")
vim.keymap.set('n', '<Space>p', ":Telescope tmux pane_contents<Enter>")
vim.keymap.set('n', '<Space>k', ":Telescope keymaps<Enter>")
vim.keymap.set("n", "<Space>e", telescope.extensions.file_browser.file_browser)
