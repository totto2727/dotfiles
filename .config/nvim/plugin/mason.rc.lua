local ok1, mason = pcall(require, "mason")
local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
local ok3, lspconfig = pcall(require, "lspconfig")
if not (ok1 and ok2 and ok3) then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "bashls" },
})

local signs = { error = " ", warn = " ", hint = " ", info = " " }
for type, icon in pairs(signs) do
  local hl = "diagnosticsign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'mf', vim.lsp.buf.format)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = vim.lsp.buf.format
    })
  end
end

local function detected_root_dir(root_dir)
  return not (not (root_dir(vim.api.nvim_buf_get_name(0), vim.api.nvim_get_current_buf())))
end

local node_root_dir = lspconfig.util.root_pattern("package.json")

-- Masonで管理しているツール
mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
      }
    end,
    ["tsserver"] = function()
      require("typescript").setup {
          autostart = detected_root_dir(node_root_dir),
          disable_commands = false, -- prevent the plugin from creating Vim commands
          debug = false, -- enable debug logging for commands
          server = { -- pass options to lspconfig's setup method
              root_dir = node_root_dir,
              on_attach = on_attach,
              capabilities = capabilities
          },
      }
    end,
}

-- Systemの実行ファイルを使用する場合
require("flutter-tools").setup {
    flutter_lookup_cmd = 'asdf where flutter',
    widget_guides = {
        enabled = true,
    },
    outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
        auto_open = true -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            analysisExcludedFolders = { "build" },
        }
    }
} -- use defaults
---- Deno
lspconfig.denols.setup {
    autostart = false,
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        lint = true,
        unstable = true,
        suggest = {
            imports = {
                hosts = {
                    ["https://deno.land"] = true,
                    ["https://cdn.nest.land"] = true,
                    ["https://crux.land"] = true,
                },
            },
        },
    },
}
