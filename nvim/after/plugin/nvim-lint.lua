vim.cmd([[
        au BufWritePost * lua require('lint').try_lint()
    ]])

require('lint').linters_by_ft = {
  dockerfile = { 'hadolint' },
  markdown = { 'markdownlint' },
  go = { 'golangcilint', },
  nix = { 'nix' },
  terraform = { 'tflint' },
}

