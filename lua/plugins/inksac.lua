return {
    { "rose-pine/neovim", name = "rose-pine" },
    { 
        "rcarriga/nvim-notify",
        config = function(_, opts)
            vim.notify = require("notify")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}

