return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Garante que a estrutura de configurações existe
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}
      opts.settings.java.configuration = opts.settings.java.configuration or {}

      -- Adiciona sua configuração de runtime sem sobrescrever o resto
      opts.settings.java.configuration.runtimes = {
        {
          name = "JavaSE-1.8",
          path = "~/.local/share/mise/installs/java/zulu-javafx-8.96.0.205/",
        },
        {
          name = "JavaSE-26",
          path = "~/.local/share/mise/installs/java/26.0.2/",
        },
      }

      return opts
    end,
  },
}
