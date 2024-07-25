return {"nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installer = {"lua", "python", "rust", "zigs"},
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
