local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  callback = function(_)
    vim.highlight.on_yank({
      higroup = "CursorLine",
      timeout = 150,
      on_macro = false,
      on_visual = true,
    })
  end,
})
