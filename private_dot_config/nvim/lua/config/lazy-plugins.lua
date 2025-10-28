require("lazy").setup({
	{ "NMAC427/guess-indent.nvim", opts = {} },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"mason-org/mason-lspconfig.nvim",
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				opts = {
					ensure_installed = { "stylua", "asm-lsp" },
				},
			},
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			"saghen/blink.cmp",
		},
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "super-tab",
			},
			fuzzy = { implementation = "lua" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
		end,
	},
})

require("lspconfig").asm_lsp.setup({
	filetypes = { "asm", "s", "S" },
})
