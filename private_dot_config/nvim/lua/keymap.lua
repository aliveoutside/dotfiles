local k = vim.keymap

k.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
k.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
k.set("", "<leader>bf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Neo-tree (File explorer)
k.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })

-- Flash.nvim (Fast jump)
k.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash jump" })
k.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

