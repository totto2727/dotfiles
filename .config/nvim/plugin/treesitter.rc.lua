if vim.g.vscode then 
  vim.treesitter.stop()
  return 
end

local ok1, ts = pcall(require, "nvim-treesitter.configs")
local ok2, autotag = pcall(require, "nvim-ts-autotag")
local ok3, autopairs = pcall(require, "nvim-autopairs")
local ok4, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not (ok1 and ok2) then return end

ts.setup {
    additional_vim_regex_highlighting = false,
    highlight = {
        enable = not vim.g.vscode,
    },
    indent = {
        enable = true,
    }
}

if ok3 then
  autotag.setup({})
end

if ok3 then
  local Rule = require 'nvim-autopairs.rule'
  local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

  autopairs.setup({
      disable_filetype = { "TelescopePrompt", "vim" },
      check_ts = true,
      map_cr = false,
      ts_config = {
          lua = { 'string' }, -- it will not add a pair on that treesitter node
          javascript = { 'template_string' },
      }
  })

  autopairs.add_rules {
      Rule(' ', ' ')
      :with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
            }, pair)
      end)
  }
  for _, bracket in pairs(brackets) do
    autopairs.add_rules {
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%' .. bracket[2]) ~= nil
        end)
        :use_key(bracket[2])
    }
  end
end

if ok4 then
  ---@type rainbow_delimiters.config
  vim.g.rainbow_delimiters = {
      strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
      },
      query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
      },
      priority = {
          [''] = 110,
          lua = 210,
      },
      highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
      },
  }
end

