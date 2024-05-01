local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default.
opts.desc = 'Run codelens'
vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)

-- Hoogle search for the type signature of the definition under the cursor
opts.desc = 'Hoogle search under the cursor'
vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)

-- Evaluate all code snippets
opts.desc = 'Evaluate all code snippets'
vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)

-- Toggle a GHCi repl for the current package
opts.desc = 'GHCi repl for current package'
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)

-- Toggle a GHCi repl for the current buffer
opts.desc = 'GHCi repl for current buffer'
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
  end,
  opts
)

-- Close the repl
opts.desc = 'Close the repl'
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

-- Open LSP floating diagnostic
vim.keymap.set('n', '<leader>lf', vim.diagnostic.open_float, { desc = 'Open floating diagnostic'})
