vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>a", ":TestFile<CR>")
vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
local g = vim.g

g.VtrPercentage = 50
g.VtrOrientation = "h"
g['test#strategy']="vtr"

