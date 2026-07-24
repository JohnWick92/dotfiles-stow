return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      transparent = true,
      background = {
        dark = "dragon", -- pode ser "wave", "dragon", "lotus"
        light = "lotus",
      },
    })

    -- aplica o colorscheme
    vim.cmd("colorscheme kanagawa-dragon")
  end,
}
