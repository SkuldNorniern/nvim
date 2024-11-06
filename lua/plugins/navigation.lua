local FZF_DROPDOWN_MINIMAL = {
  fzf_opts = { ["--layout"] = "reverse" },
  header = false,
  previewer = true,
  winopts = { width = 70, height = 15, row = 0.5, col = 0.5 },
}

local FZF_DROPDOWN_PREVIEW = {
  fzf_opts = { ["--layout"] = "reverse" },
  winopts = {
    width = 70,
    height = 48,
    row = 0.5,
    col = 0.5,
    preview = { layout = "vertical" },
  },
}

return {
  -- fuzzy finder: FZF integration
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- frequently used navigation methods
      {
        "<C-p>",
        function()
          require("fzf-lua").files(FZF_DROPDOWN_MINIMAL)
        end,
        desc = "Find Files",
      },
      {
        "<Leader>/",
        function()
          require("fzf-lua").lsp_document_symbols(FZF_DROPDOWN_PREVIEW)
        end,
        desc = "Find Symbols",
      },
      -- meta
      { "<Leader>f ", "<Cmd>FzfLua builtin<CR>", desc = "Pickers" },
      { "<Leader>f.", "<Cmd>FzfLua resume<CR>", desc = "Resume" },
      -- files
      { "<Leader>ff", "<Cmd>FzfLua files<CR>", desc = "Files" },
      { "<Leader>fg", "<Cmd>FzfLua git_files<CR>", desc = "Git Files" },
      -- search
      { "<Leader>f/", "<Cmd>FzfLua grep_curbuf<CR>", desc = "Grep File" },
      { "<Leader>f?", "<Cmd>FzfLua live_grep<CR>", desc = "Grep CWD" },
      -- RTFM
      { "<Leader>fh", "<Cmd>FzfLua helptags<CR>", desc = "Help Tags" },
      { "<Leader>fm", "<Cmd>FzfLua manpages<CR>", desc = "Man Pages" },
      -- lists
      { "<Leader>fa", "<Cmd>FzfLua args<CR>", desc = "Args" },
      { "<Leader>fq", "<Cmd>FzfLua quickfix<CR>", desc = "Quickfix" },
      { "<Leader>fl", "<Cmd>FzfLua loclist<CR>", desc = "Loclist" },
      -- LSP
      { "<Leader>fi", "<Cmd>FzfLua lsp_finder<CR>", desc = "LSP Finder" },
      {
        "<Leader>fd",
        "<Cmd>FzfLua diagnostics_document<CR>",
        desc = "Document Diagnostics",
      },
      {
        "<Leader>fD",
        "<Cmd>FzfLua diagnostics_workspace<CR>",
        desc = "Workspace Diagnostics",
      },
      {
        "<Leader>fs",
        "<Cmd>FzfLua lsp_document_symbols<CR>",
        desc = "Document Symbols",
      },
      {
        "<Leader>fS",
        "<Cmd>FzfLua lsp_live_workspace_symbols<CR>",
        desc = "Workspace Symbols",
      },
      -- misc
      { "<Leader>f:", "<Cmd>FzfLua commands<CR>", desc = "Commands" },
      { "<Leader>fy", "<Cmd>FzfLua registers<CR>", desc = "Registers" },
    },
    init = function(_)
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("fzf-lua").register_ui_select(FZF_DROPDOWN_PREVIEW)
        return vim.ui.select(...)
      end
    end,
    opts = function(_, _)
      return {
        "telescope",
        winopts = { backdrop = 100 },
        lsp = {
          symbols = {
            symbol_icons = require("lspkind").symbol_map,
            symbol_hl = function(s)
              return "Aerial" .. s .. "Icon"
            end,
            symbol_fmt = function(s, _)
              return s
            end,
          },
          code_actions = { previewer = "codeaction_native" }
        },
      }
    end,
  },

  -- file explorer: edit filesystem like a text buffer
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "-", "<Cmd>Oil --float<CR>", "Browse Parent Dir" },
      { "_", "<Cmd>Oil . --float<CR>", "Browse CWD" },
    },
    opts = {
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      float = {
        max_width = 120,
        max_height = 35,
        border = "solid",
      },
      preview = { border = "solid" },
      ssh = { border = "solid" },
      keymaps_help = { border = "solid" },
    },
  },

  -- code outline: view and jump to the tree of symbols
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<Leader>a", "<Cmd>AerialToggle<CR>", desc = "Code Outline" },
    },
    opts = {
      backends = { "treesitter", "markdown", "asciidoc", "man" },
      layout = {
        min_width = 24,
        max_width = 34,
        win_opts = { winhl = "Normal:NormalFloat" },
        default_direction = "left",
      },
      highlight_mode = "full_width",
      highlight_on_hover = true,
      highlight_on_jump = false,
      close_on_select = true,
      show_guides = true,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
    },
  },

  -- floating terminal window: quick shell access
  {
    "akinsho/toggleterm.nvim",
    keys = { "<S-Tab>" },
    opts = {
      open_mapping = "<S-Tab>",
      persist_size = false,
      persist_mode = false,
      direction = "float",
      on_open = function(_)
        vim.wo.winhl = ""
      end,
      float_opts = {
        border = "solid",
        width = function(_)
          return math.min(120, vim.o.columns - 6)
        end,
        height = function(_)
          return math.min(35, math.floor(vim.o.lines * 0.7))
        end,
      },
    },
  },
}
