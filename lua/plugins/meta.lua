return {
    -- be lazy or something idk
    { "folke/lazy.nvim" },
    {
        "onsails/lspkind.nvim",
        opts = {
            preset = "codicons",
            symbol_map = {
                Text = "󰉿",
                Snippet = "",
            },

        },
    },
    -- babysit some trees idk
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- install these on startup
            ensure_installed = {
                "bash",
                "comment",
                "git_rebase",
                "gitcommit",
            },
            -- install missing parsers on demand
            auto_install = true,

            -- semantic code highlighting
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    -- fixes broken highlights inside cmdline window (#3961)
                    if lang == "vim" then
                        local bufname = vim.api.nvim_buf_get_name(buf)
                        return string.match(bufname, "%[Command Line%]")
                    end
                end,
                additional_vim_regex_highlighting = false,
            },

            -- builtin indent module have some flaws
            indent = { enable = false },
            -- using yati instead while it gets fixed
            yati = { enable = true },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["a/"] = "@comment.outer",
                    },
                    include_surrounding_whitespace = function(args)
                        return args.query_string:match("outer")
                    end,
                },

                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]]"] = "@class.outer",
                        ["]m"] = "@function.outer",
                    },
                    goto_next_end = {
                        ["]["] = "@class.outer",
                        ["]M"] = "@function.outer",
                    },
                    goto_previous_start = {
                        ["[["] = "@class.outer",
                        ["[m"] = "@function.outer",
                    },
                    goto_previous_end = {
                        ["[]"] = "@class.outer",
                        ["[M"] = "@function.outer",
                    },
                },

                swap = {
                    enable = true,
                    swap_next = {
                        ["],"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["[,"] = "@parameter.inner",
                    },
                },
            },

            textsubjects = {
                enable = true,
                prev_selection = "<BS>",
                keymaps = {
                    ["<CR>"] = "textsubjects-smart",
                    ["a<CR>"] = "textsubjects-container-outer",
                    ["i<CR>"] = "textsubjects-container-inner",
                },
            },

            endwise = { enable = true },

            context_commentstring = {
                enable_autocmd = false,
            },

            matchup = {
                enable = true,
                disable_virtual_text = true,
                include_match_words = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "tris203/precognition.nvim",
        --event = "VeryLazy",
        opts = {
            -- startVisible = true,
            -- showBlankVirtLine = true,
            -- highlightColor = { link = "Comment" },
            -- hints = {
            --      Caret = { text = "^", prio = 2 },
            --      Dollar = { text = "$", prio = 1 },
            --      MatchingPair = { text = "%", prio = 5 },
            --      Zero = { text = "0", prio = 1 },
            --      w = { text = "w", prio = 10 },
            --      b = { text = "b", prio = 9 },
            --      e = { text = "e", prio = 8 },
            --      W = { text = "W", prio = 7 },
            --      B = { text = "B", prio = 6 },
            --      E = { text = "E", prio = 5 },
            -- },
            -- gutterHints = {
            --     G = { text = "G", prio = 10 },
            --     gg = { text = "gg", prio = 9 },
            --     PrevParagraph = { text = "{", prio = 8 },
            --     NextParagraph = { text = "}", prio = 8 },
            -- },
            -- disabled_fts = {
            --     "startify",
            -- },
        },
    }
}