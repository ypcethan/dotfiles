-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.clipboard = 'unnamedplus'
vim.o.swapfile = false
vim.o.scrolloff = 6
vim.o.splitbelow = true
vim.o.splitright = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Complete the longest common match, and allow tabbing the result to fully complete them
vim.o.wildmode = 'longest:full,full'

vim.o.title = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Decrease update time
vim.o.updatetime = 250
-- vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Remove ~ (end of buffer)
vim.opt.fillchars:append({ eob = ' ' })

-- Ask for confirmation instead of erroring
vim.opt.confirm = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true

vim.opt.signcolumn = 'yes:2'
