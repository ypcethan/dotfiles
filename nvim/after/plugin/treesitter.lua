require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
        ['ib'] = '@block.inner',
        ['ab'] = '@block.outer',
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
})
