-- sync with system clipboard on focus gained
vim.api.nvim_create_autocmd({ "FocusGained" }, {
	pattern = { "*" },
	command = [[call setreg("@", getreg("+"))]],
})


-- sync with system clipboard on focus lost
vim.api.nvim_create_autocmd({ "FocusLost" }, {
	pattern = { "*" },
	command = [[call setreg("+", getreg("@"))]], 
})
