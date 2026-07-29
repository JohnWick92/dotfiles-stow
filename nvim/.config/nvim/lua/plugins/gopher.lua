return {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- branch = "develop"
  -- (optional) updates the plugin's dependencies on each update
  -- build = function()
  --   vim.cmd.GoInstallDeps()
  -- end,
  ---@module "gopher"
  ---@type gopher.Config
  opts = {},
  config = function(_, opts)
    require("gopher").setup(opts)
    vim.keymap.set("n", "<leader>cp", function()
      require("gopher").iferr()
    end, { buffer = true, desc = "Go: Add if err check" })
  end,
}
