---@diagnostic disable: lowercase-global
local ok, _ = pcall(require, "lspconfig")
if not ok then return end

vim.cmd [[
call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', ['snippy', 'nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
      \   'converters': ['converter_remove_overlap']
      \ },
      \ 'nvim-lsp': {
      \   'mark': 'lsp',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
      \ }})
call popup_preview#enable()
call signature_help#enable()

inoremap <silent><expr> <TAB>
\ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\ snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)':
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' :
\ ddc#map#manual_complete()
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'

inoremap <silent><expr> <S-Tab>
\ pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' :
\ snippy#can_jump(-1) ? '<Plug>(snippy-previous)' :
\ '<S-Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'

inoremap <expr> <Enter> 
\ pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' :
\ '<CR>'

call ddc#enable()
]]

local ok2, snippy = pcall(require, 'snippy')
local ok3, util = pcall(require, "util")
if not (ok2 and ok3) then return end

upeer_first = util.upper_first
lower_first = util.lower_first
upeer = util.upper
lower = util.lower
pascal = util.to_pascal
camel = util.to_camel
snake = util.to_snake
constant = util.to_constant
kebab = util.to_kabab
kebabUpper = util.to_kabab_upper
rust_type_to_struct_shorthand = util.rust_type_to_struct_shorthand

snippy.setup({
  mappings = {
    is = {
      ['<C-l>'] = 'expand_or_advance',
      ['<C-h>'] = 'previous',
    },
  },
})
