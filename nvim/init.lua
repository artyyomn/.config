vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
--opt.expandtab = true 			--spaces over tabs
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.opt.fillchars:append({eob = " "})
vim.opt.showtabline = 0
vim.opt.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.path:append("**")

--vim.opt.list = true
--vim.opt.listchars = {
--  tab = "»·",
--  trail = "·",
--  space = "·",
--}

-- packages
vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/windwp/nvim-autopairs' },
	{ src = 'https://github.com/vague-theme/vague.nvim' },
	{ src = 'https://github.com/nvim-mini/mini.pick'},
	{ src = 'https://github.com/xero/miasma.nvim'},
}

--colors
vim.opt.background = dark
vim.cmd.colorscheme("meliora")

require('nvim-autopairs').setup()
require('mini.pick').setup({
	window = {
		config = function()
			local height = math.floor(vim.o.lines * 0.7)
			local width = math.floor(vim.o.columns * 0.7)

			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor((vim.o.lines - height) / 2),
				col = math.floor((vim.o.columns - width) / 2),
				border = "rounded",
			}
		end,
	},

	options = {
		use_cache = true,
	},
})

vim.opt.termguicolors = true
--vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
--vim.cmd [[highlight NormalNC guibg=NONE ctermbg=NONE]]
--vim.cmd [[highlight TabLineFill guibg=NONE ctermbg=NONE]]
--vim.cmd [[highlight TabLine guibg=NONE ctermbg=NONE]]
--vim.cmd [[highlight StatusLineNC guibg=NONE ctermbg=NONE]]
--vim.cmd [[ hi! NormalFloat guibg=NONE ctermbg=NONE]]
--vim.cmd [[hi! FloatBorder guibg=NONE ctermbg=NONE ]]

-- autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.autocomplete = true   -- 0.12 feature
--vim.o.pumheight = 5
--vim.o.pumblend = 10
--vim.o.winblend = 10
vim.o.winborder = 'single'

-- lsp hover
vim.lsp.buf.hover({
	border = "single",
})

-- lsps
vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
vim.lsp.enable('vtsls')
vim.lsp.enable('rust-analyzer')

vim.lsp.config('rust-analyzer',{
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {},
	},
})

vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false, -- less flicker
	float = { border = "single", source = "always"},
	signs=false,
	--virtual_text = {
		--	  prefix = "●",   -- Could be "●", "▎", "■"
		--	  spacing = 4,
		--	  source = "if_many", -- Show source if multiple LSPs
		--  },
	virtual_text = false,
})

-- keymaps
vim.g.mapleader = " "
local map = vim.keymap.set
local opts = {noremap = true, silent = true}
--basic stuffs
map("n", "<Space>", "<Nop>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "<leader>f", ":Pick files<CR>", opts)

--map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--<C-]> for go to definition undner cursor :)
--<C-o> for going back in jump list
--<C-i> for going forward in jump list

--gra  --  Code actions
--gri  --  Go to implementation
--grn  --  Rename symbol
--grr  --  List references
--grt  --  Go to type definition
--gx   --  go to url under cursor
--gf   --  go to file under cursor

--tab movements
map("n", "<A-q>", ":tabp<CR>", opts)
map("n", "<A-w>", ":tabn<CR>", opts)
map("n", "<A-n>", ":tabnew<CR>", opts)
map("n", "<A-f>", ":tabfirst<CR>", opts)
map("n", "<A-l>", ":tablast<CR>", opts)

--<C-w>s  → horizontal split (:split)
--<C-w>v  → vertical split (:vsplit)
--<C-w>c  → close current window (:close)
--<C-w>o  → close all other windows, keep only current (:only)
--<C-w>=  → make all windows equal size
--<C-w>+ / <C-w>- → increase/decrease height
--<C-w>> / <C-w>< → increase/decrease width

-- netrw configuration
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3  		-- 0 = tree, 1 = long, 2 = short, 3 = detailed
vim.g.netrw_banner = 0
