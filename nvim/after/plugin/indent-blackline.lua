vim.cmd([[
  hi I1 ctermfg=24 guifg=#800000
  hi I2 ctermfg=66 guifg=#003d99
  hi I3 ctermfg=100 guifg=#145252
  hi I4 ctermfg=132 guifg=#cc8800
]])

vim.g.indent_blankline_char_highlight_list = { 'I1', 'I2', 'I3', 'I4' }
