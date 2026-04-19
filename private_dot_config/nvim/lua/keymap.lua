local k = vim.keymap

k.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
k.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
k.set("", "<leader>bf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

