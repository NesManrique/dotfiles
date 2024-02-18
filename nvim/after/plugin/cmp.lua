local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- Fix Tab key behavior when using copilot
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup {
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- can also be a function to dynamically calculate max width such as
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      symbol_map = { Copilot = "" }, -- Add copilot symbol to symbol_map
    })
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- Ctrl + N to select the next item
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Ctrl + P to select the previous item
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- Ctrl + D to scroll down the documentation
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- Ctrl + F to scroll up the documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- Ctrl + Space to complete the current item
    ['<C-Space>'] = cmp.mapping.complete {},
    -- CR to confirm the selection
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- Tab to select the next item or expand the snippet
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Shift + Tab to select the previous item or jump to the previous snippet
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'copilot',  group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'path',     group_index = 2 },
    { name = 'luasnip',  group_index = 2, keyword_length = 2 },
    { name = 'nvim_lua', group_index = 2 },
    { name = 'buffer',   group_index = 2, keyword_length = 3 },
  },
}
