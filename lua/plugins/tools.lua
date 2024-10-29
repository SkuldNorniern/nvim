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
        "tpope/vim-fugitive",
        config = function()
            local vim = vim
            -- local wk = require("which-key")

            -- wk.register({
            --     ["<Leader>g"] = {
            --         name = "+git",
            --         i = { "<Cmd>tab G<CR>", "index" },
            --         r = { "<Cmd>Git restore %<CR>", "restore buffer" },
            --         s = { "<Cmd>Git stage %<CR>", "stage buffer" },
            --         u = { "<Cmd>Git reset -q %<CR>", "unstage buffer" },
            --     },
            -- })
                        -- Directly map keys without using which-key
            vim.api.nvim_set_keymap('n', '<Leader>gi', '<Cmd>tab G<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gr', '<Cmd>Git restore %<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gs', '<Cmd>Git stage %<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gu', '<Cmd>Git reset -q %<CR>', { noremap = true, silent = true })

            -- trigger "User InGitRepo" event upon entering a Git repository
            -- can be used to lazy load other Git related plugins
            -- `nvim-rooter.lua` allows us to use "DirChanged" instead of "BufRead"
            vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
                callback = function()
                    -- local gitdir = vim.loop.cwd() .. "/.git"
                    -- if vim.loop.fs_stat(gitdir) then
                    local cmd = "git rev-parse --is-inside-work-tree"
                    if vim.fn.system(cmd) == "true\n" then
                        vim.api.nvim_exec_autocmds("User", { pattern = "InGitRepo" })
                        return true -- remove this autocmd after loading other plugins
                    end
                end,
                group = vim.api.nvim_create_augroup("DetectGitRepo", {}),
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
