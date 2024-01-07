return {
	{
		"lambdalisue/fern.vim",
		config = function()
			require("fern_conf")
		end,
		dependencies = {
			{
				"lambdalisue/fern-git-status.vim",
			},
			{
				"TheLeoP/fern-renderer-web-devicons.nvim",
				dependencies = { "nvim-tree/nvim-web-devicons" },
				config = function()
					vim.g["fern#renderer"] = "nvim-web-devicons"
				end,
			},
		},
		keys = {
			{ "<C-f>", ":Fern . -reveal=%<CR>" },
		},
		event = "FileType",
	},

	{
		"lambdalisue/fern-hijack.vim",
		lazy = false,
	},
}
