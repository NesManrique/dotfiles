return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        bashls = {},
        gopls = {},
        helm_ls = {},
        lua_ls = {},
        marksman = {},
        yamlls = {},
        terraformls = {},
        nil_ls = {},
      },
    },
  },
}
