return {
	{
		"lambdalisue/fern.vim",
		config = function()
			require("fern_conf")
		end,
    keys = {
      { "<C-f>", ":Fern . -reveal=%<CR>" }
    },
    event = "FileType"
	},

	{
		"lambdalisue/fern-git-status.vim",
	},

	{
		"lambdalisue/fern-hijack.vim",
    lazy = false
	},

	{
		"TheLeoP/fern-renderer-web-devicons.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g["fern#renderer"] = "nvim-web-devicons"
		end,
	},
}
