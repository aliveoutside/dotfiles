vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/NMAC427/guess-indent.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/j-hui/fidget.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/CRAG666/betterTerm.nvim",
	"https://github.com/nvim-mini/mini.clue.git",
	"https://github.com/ibhagwan/fzf-lua",
})
vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("mason").setup({})
require("lazydev").setup()
require("nvim-treesitter").setup({})
require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	fuzzy = { implementation = "lua" },
	sources = {
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
})
require("conform").setup({ formatters_by_ft = { lua = { "stylua" } } })
require("neo-tree").setup({
	filesystem = {
		cwd_target = {
			sidebar = "global",
			current = "global",
		},
	},
})

require("plugins/betterTerm")
require("plugins/fzf")

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },

		{ mode = "n", keys = "f" },
		{ mode = "x", keys = "f" },
	},
	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.z(),
	},
})
