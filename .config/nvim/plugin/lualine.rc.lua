local ok, lualine = pcall(require, "lualine")
if not ok then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    section_separators = { " " },
    component_separators = { " " },
    disabled_filetypes = {},
    -- globalstatus = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 1, newfile_status = true } },
    lualine_c = {},
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      }
    },
    lualine_y = { 'encoding', 'filetype' },
    lualine_z = { 'location', 'progress' }

  },
  extensions = { 'fugitive' }
}
