local betterTerm = require("betterTerm")
betterTerm.setup()

local k = vim.keymap

k.set({ "n", "t" }, "<C-;>", function()
	betterTerm.open()
end, { desc = "Toggle terminal" })
k.set({ "n", "t" }, "<C-/>", function()
	betterTerm.open(1)
end, { desc = "Toggle terminal 1" })
k.set("n", "<leader>tt", betterTerm.select, { desc = "Select terminal" })
k.set("n", "<leader>tr", betterTerm.rename, { desc = "Rename terminal" })
k.set("n", "<leader>tb", betterTerm.toggle_tabs, { desc = "Toggle terminal tabs" })
