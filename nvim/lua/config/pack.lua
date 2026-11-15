-- Build hooks must be registered before the first vim.pack.add()
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    local path = ev.data.path

    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      -- main branch: refresh installed parsers to lockfile revisions
      pcall(vim.cmd, 'TSUpdate')
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/everviolet/nvim', name = 'evergarden' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/folke/lazydev.nvim' },
}, { confirm = false })
