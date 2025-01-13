return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "gq ",
        function()
          require("conform").format()

        end,
        desc = "Format File",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
      },
    },
    init = function(_)
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("conform_formatexpr", {}),
        callback = function(_)

          vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
      })
    end,
  },
}
