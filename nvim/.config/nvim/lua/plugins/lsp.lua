return {
  "neovim/nvim-lspconfig",

  -- When coding on vue project change opts to config
  opts = function()
    local vue_language_server_path =
      "/home/shanks/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/"
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    }
    local vue_ls_config = {
      filetypes = { "vue" },
    }
    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.enable({
      "vtsls",
      "vue_ls",
    })
  end,
}
