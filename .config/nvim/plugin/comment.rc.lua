local ok1, comment = pcall(require, 'Comment')
local ok2, configs = pcall(require, 'nvim-treesitter.configs')
if not (ok1 and ok2) then return end

configs.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
