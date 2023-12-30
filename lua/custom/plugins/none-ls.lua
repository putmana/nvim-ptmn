return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local null_ls = require 'null-ls'

    local sources = {
      -- Lua
      null_ls.builtins.formatting.stylua,

      -- JavaScript
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.prettier,

      -- Rust
      null_ls.builtins.formatting.rustfmt,

      -- Spellcheck
      null_ls.builtins.completion.spell,
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
            vim.lsp.buf.format { async = false }
          end,
        })
      end
    end

    null_ls.setup {
      sources = sources,
      on_attach = on_attach,
    }

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
  end,
}
