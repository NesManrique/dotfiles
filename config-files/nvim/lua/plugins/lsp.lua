return {
  "folke/neodev.nvim",
  {
    "onsails/lspkind.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local h = require("config.helpers")
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        h.NormalRemap("K", vim.lsp.buf.hover, opts)
        h.NormalRemap("gd", vim.lsp.buf.definition, opts)
        h.NormalRemap("gD", vim.lsp.buf.declaration, opts)
        h.NormalRemap("gI", vim.lsp.buf.implementation, opts)
        h.NormalRemap("<leader>D", vim.lsp.buf.type_definition, opts)

        h.NormalRemap("<leader>r", vim.lsp.buf.rename, opts)
        h.NormalRemap("<leader>ac", vim.lsp.buf.code_action, opts)

        h.NormalRemap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
        h.NormalRemap("[d", vim.diagnostic.goto_next, opts)
        h.NormalRemap("]d", vim.diagnostic.goto_prev, opts)

        h.NormalRemap("gr", require("telescope.builtin").lsp_references, opts)
        h.NormalRemap("<leader>s", require("telescope.builtin").lsp_document_symbols, opts)
        h.NormalRemap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format()
        end, {})
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local servers = {
        "bashls",
        "gopls",
        "lua_ls",
        "rust_analyzer",
        "terraformls",
        "yamlls",
        "vale_ls",
      }

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      for _, server_name in ipairs(servers) do
        vim.lsp.config(server_name, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      require("neodev").setup()
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      for _, server_name in ipairs(servers) do
        vim.lsp.enable(server_name)
      end
    end,
  },
}
