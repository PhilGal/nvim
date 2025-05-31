return {
  {
    "nvim-java/nvim-java",
    dependencies = {
      { "mason-org/mason.nvim", version = "1.11.0" },
      { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
    },
    config = function()
      require("java").setup({
        jdk = {
          auto_install = false,
        },
        java_debug_adapter = {
          enable = false,
        },
      })
    end,
  }
}
