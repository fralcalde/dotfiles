return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            -- Your custom jdtls settings goes here
            root_dir = require("lspconfig").util.root_pattern(
              ".git",
              "mvnw",
              "gradlew",
              "pom.xml",
              "build.gradle",
              "build.gradle.kts"
            )(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())),
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              -- Your custom nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
