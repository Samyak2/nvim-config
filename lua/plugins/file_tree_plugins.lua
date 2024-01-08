return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				delete_to_trash = true,
			})
		end,
		lazy = false,
		keys = {
			{ "<C-f>", "<CMD>Oil<CR>" },
		},
	},
}
