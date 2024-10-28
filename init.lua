vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


require("config.options")
require("config.autocmds")
require("config.keymaps")


require("config.lazy")


-- colorscheme to rose-pine
vim.cmd.colorscheme("rose-pine-moon")