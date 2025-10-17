return {
    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            -- settings recommended by the plugin
            vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

            require("auto-session").setup {
                log_level = "error",
                suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end,
    },
}
