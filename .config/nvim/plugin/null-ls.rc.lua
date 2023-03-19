local ok1, _ = pcall(require, "mason")
local ok2, null_ls = pcall(require, "null-ls")
local ok3, mason_null_ls = pcall(require, "mason-null-ls")
if not (ok1 and ok2 and ok3) then return end

mason_null_ls.setup({
  ensure_installed = { "shfmt", "shellharden", "shellcheck" }
})

mason_null_ls.setup_handlers {
  function(source_name, methods)
    require('mason-null-ls.automatic_setup')(source_name, methods)
  end,
}

null_ls.setup({
  sources = {
    -- Fish
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.diagnostics.fish,
    -- Javascript
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier

    -- Deno
    -- null_ls.builtins.formatting.deno_fmt.with {
    --     condition = function(utils)
    --       return not (utils.has_file { ".prettierrc", ".prettierrc.js" })
    --     end,
    -- }
  }
})

vim.keymap.set('n', '<M-n>', '<Nop>')
vim.keymap.set('n', '<M-p>', '<Nop>')
