local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
-- local cmd = { "rustup", "run", "stable", "rust-analyzer", }

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.r_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.pylsp.setup{}
