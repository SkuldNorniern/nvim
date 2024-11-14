local map = vim.keymap.set

map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map({"n", "x", "o"}, "/", "/\\v", { desc = "Regex Search" })
map({"n", "x", "o"}, "?", "?\\v", { desc = "Reverse Regex Search" })
map({"n", "x", "o"}, "g/", "/\\v", { desc = "Regex Search" })
map({"n", "x", "o"}, "g?", "?\\v", { desc = "Reverse Regex Search" })

map("n", "-", "<Cmd>edit %:h<CR>", { desc = "Explorer Parent Dir" })
map("n", "_", "<Cmd>edit .<CR>", { desc = "Explorer CWD" })

map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Force Quit" })
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<leader>W", "<Cmd>wa<CR>", { desc = "Save All" })
map("n", "<leader>x", "<Cmd>x<CR>", { desc = "Save & Quit" })
map("n", "<leader>X", "<Cmd>x!<CR>", { desc = "Force Save & Quit" })

map("n", "<Leader>p", "<Cmd>Precognition toggle<CR>", { desc = "Toggle Precognition" })
