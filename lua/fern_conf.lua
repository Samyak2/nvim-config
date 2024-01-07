vim.g["fern#default_hidden"] = 1
vim.g["fern#default_exclude"] = ".git"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "fern",
	callback = function(args)
		local key_opts = { buffer = args.buf, remap = true }
		vim.keymap.set("n", "<C-h>", "<Plug>(fern-action-hidden:toggle)", key_opts)
		vim.keymap.set("n", "<C-r>", "<Plug>(fern-action-reload:all)", key_opts)
		vim.keymap.set("n", "N", "<Plug>(fern-action-new-path)", key_opts)
		vim.keymap.set("n", "<C-f>", "<C-o>", key_opts)
	end,
})
