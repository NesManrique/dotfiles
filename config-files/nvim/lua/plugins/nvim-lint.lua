return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      require("lint").linters_by_ft = {
        dockerfile = { "hadolint" },
        markdown = { "markdownlint" },
        go = { "golangcilint" },
        nix = { "nix" },
        terraform = { "tflint" },
      }
    end,
  },
}
