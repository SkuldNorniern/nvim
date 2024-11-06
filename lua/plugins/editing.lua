return {
    -- I never comment but whatever
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        keys = { "cs", "ds", "ys", { "S", mode = "x" } },
        opts = {},
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {},
    },
    {
        "RRethy/nvim-treesitter-endwise",
        event = "InsertEnter",
        opts = { enable = true },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup({ endwise = opts })
        end,
    },
    {
        "Wansmer/treesj",
        keys = {
            { "gS", "<Cmd>TSJSplit<CR>" },
            { "gJ", "<Cmd>TSJJoin<CR>" },
            { "gM", "<Cmd>TSJToggle<CR>" },
        },
        opts = { use_default_keymaps = false },
    },
    {
        "nmac427/guess-indent.nvim",
        event = "BufReadPre",
        opts = {},
    },
}
