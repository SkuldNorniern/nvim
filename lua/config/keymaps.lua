local map = vim.keymap.set

map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map({"n", "x", "o"}, "/", "/\\v", { desc = "Regex Search" })
map({"n", "x", "o"}, "?", "?\\v", { desc = "Reverse Regex Search" })
map({"n", "x", "o"}, "g/", "/\\v", { desc = "Regex Search" })
map({"n", "x", "o"}, "g?", "?\\v", { desc = "Reverse Regex Search" })
