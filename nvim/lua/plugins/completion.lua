return {
  -- Add lsp-zero and related plugins
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },           -- Required
      { "williamboman/mason.nvim" },         -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" },   -- Optional
      { "hrsh7th/cmp-path" },     -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
    config = function()
      -- LSP Zero configuration
      local lsp = require("lsp-zero").preset({
        name = "recommended",
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = true,
      })

      lsp.setup()

      -- Additional nvim-cmp configuration
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()

      cmp.setup({
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_action),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_action),
          ["<C-Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }
      })
    end,
  },
}

