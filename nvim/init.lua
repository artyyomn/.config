require("ash.opt")
require("ash.key")
require("ash.plug")
require("ash.lsp")
require("ash.term")
require("ash.status")
require("ash.netrw")

--vim.cmd("colorscheme quiet")
vim.cmd("colorscheme vague")
--vim.cmd("colorscheme retrobox")

--take terminal colors
vim.opt.termguicolors = true
vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight NormalNC guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight TabLineFill guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight TabLine guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight StatusLine guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight StatusLineNC guibg=NONE ctermbg=NONE]]
