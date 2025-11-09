return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").gopls.setup {}
      require("lspconfig").rust_analyzer.setup({
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      })

      vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
      vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end)
      vim.diagnostic.config({
        virtual_text = false
      })

      -- Show line diagnostics automatically in hover window
      vim.o.updatetime = 250
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
    end,
  }
}
