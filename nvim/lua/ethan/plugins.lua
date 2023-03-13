-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  use('christoomey/vim-tmux-navigator')
  use('farmergreg/vim-lastplace') -- Jump to the last location when opening a file
  use('tpope/vim-commentary')
  use('tpope/vim-repeat')
  use('tpope/vim-surround')
  use('tpope/vim-eunuch') -- Adds :Rename, :SudoWrite
  use('tpope/vim-unimpaired') -- Adds [b and other handy mappings
  use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support
  use('jessarcher/vim-heritage') -- Automatically create parent dirs when saving
  use('nelstrom/vim-visual-star-search') -- Enable * searching with visually selected text.
  use('sheerun/vim-polyglot') -- Add more langauges

  -- Adding text object to select HTML attribute
  -- ix, ax
  use({
      'whatyouhide/vim-textobj-xmlattr',
      requires = 'kana/vim-textobj-user',
    })


  use({
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end,
    })

  -- Add smooth scolling to avoid jarring jumps
  use({
      'karb94/neoscroll.nvim',
    })

  -- Close buffer without close the window
  use({
      'famiu/bufdelete.nvim',
      config = function()
        vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
      end,
    })

  -- Split arrays and method onto multiple lines, or join them back.
  use({
      'AndrewRadev/splitjoin.vim',
    })

  -- Automatically fix indentation when pasting code.
  use({
      'sickill/vim-pasta',
    })

  -- Colorscheme
  use({
      'jessarcher/onedark.nvim',
      config = function()
        vim.cmd('colorscheme onedark')

        -- Hide the characters in FloatBorder
        vim.api.nvim_set_hl(0, 'FloatBorder', {
            fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
            bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          })

        -- Make the StatusLineNonText background the same as StatusLine
        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
          })

        -- Hide the characters in CursorLineBg
        vim.api.nvim_set_hl(0, 'CursorLineBg', {
            fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
            bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
          })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
        vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
      end,
    })

  use({
      'nvim-lualine/lualine.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
    })

  use({
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
    })

  use({
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'kyazdani42/nvim-web-devicons' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
      },
    })

  use({
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      after = 'onedark.nvim',
    })

  use({
    'lukas-reineke/indent-blankline.nvim',
  })

  use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
    cmd = 'G',
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  })

 use({
  'neovim/nvim-lspconfig',
  requires = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
      },
    })
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
  })

