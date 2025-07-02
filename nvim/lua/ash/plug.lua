-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found, cloning...")
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
	  vim.api.nvim_echo({
		  { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
		  { out, "WarningMsg" },
		  { "\nPress any key to exit..." },
	  }, true, {})
	  vim.fn.getchar()
	  os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		'rebelot/kanagawa.nvim',
		priority = 1000,
		config= true,
	},

    {
        'vague2k/vague.nvim',
		priority = 1000,
		config = true,
    },

	{  "rose-pine/neovim",
		priority = 1000,
		config = function()
			--vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"nvim-telescope/telescope.nvim", 
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
			require('lspconfig').clangd.setup {capabilities = capabilities}
			require('lspconfig').gopls.setup {capabilities = capabilities}
		end,
	},

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {"html", "go"},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            }
        end
    },

	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			keymap = { preset = 'super-tab' },

			appearance = {
				nerd_font_variant = 'mono'
			},

			completion = { documentation = { auto_show = true} },
        },

	},
})
