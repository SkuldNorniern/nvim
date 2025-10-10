return {
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
    },
    {
        { 'wakatime/vim-wakatime', lazy = false }
    }
}
