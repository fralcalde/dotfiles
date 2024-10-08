local cmp = require "cmp"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
      ensure_installed = {
        "rust-analyzer",
        "r-languageserver",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "saecki/crates.nvim",
    ft = {"toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = {{ name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function (_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      table.insert(M.sources, {name = "cmp_nvim_r"})
      return M
    end,
  },

  -- R plugins
  {
    "jalvesaq/cmp-nvim-r",
    opts = {
      filetypes = {'r', 'rmd', 'quarto'},
      doc_width = 58,
    }
  },
  {
    "jalvesaq/Nvim-R",
  },

  -- Haskell plugins
  {
    "mrcjkb/haskell-tools.nvim",
    version = '^3',
    lazy = false,
  },

	-- Java plugins
	{
		"nvim-java/nvim-java",
		config = false,
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				opts = {
					servers = {
						jdtls = {
							-- your jdtls configuration goes here
						},
					},
					setup = {
						jdtls = function()
							require("java").setup({
								-- your nvim-java configuration goes here
							})
						end,
					},
				},
			},
		},
	}
}

return plugins
