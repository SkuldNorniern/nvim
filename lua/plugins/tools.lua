return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return math.max(math.min(16, vim.o.lines * 0.25), 5)
                    elseif term.direction == "vertical" then
                        return math.min(80, math.floor(vim.o.columns * 0.5))
                    end
                end,

                open_mapping = "<S-Tab>",
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,

                persist_size = false,
                persist_mode = false,

                on_open = function(term)
                    if term.direction == "float" then
                        vim.wo.winhl = ""
                    end
                end,

                direction = "float",
                close_on_exit = true,
                auto_scroll = true,

                float_opts = {
                    border = "solid",
                    width = function(_)
                        return math.min(120, vim.o.columns - 6)
                    end,
                    height = function(_)
                        return math.min(35, math.floor(vim.o.lines * 0.7))
                    end,
                    winblend = nil,
                },
            })
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
        end
    }
}
