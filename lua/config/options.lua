local opt = vim.opt

opt.mouse = "nv"
opt.title = true
opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.undofile = false
-- FEAT: LATER: Configure Undo File


opt.timeoutlen = 350
opt.updatetime = 1000

opt.sessionoptions = {
    "curdir",
    "folds",
    "globals",
    "help",
    "skiprtp",
    "localoptions",
    "tabpages",
    "terminal",
    "winsize",
}

opt.jumpoptions = { "stack", "view" }

-- window splits
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "topline" 
-- FEAT: LATER: topline | screen | cursor  need to be tested  

opt.laststatus = 3

opt.signcolumn = "auto:1"
opt.number = true
opt.relativenumber = true
opt.numberwidth = 3


opt.scrolloff = 27
opt.sidescrolloff = 9
-- opt.smoothscroll = true


opt.cursorline = true
opt.cursorlineopt =  "both"


-- special characters
opt.list = false
opt.listchars = { eol = "↲", tab = "󰌒 ", trail = "•" }
opt.fillchars = {
  diff = " ",
  eob = " ",
  fold = " ",
  foldopen = "",
  foldclose = "",
}


-- completion menu
opt.wildmode = "longest:full,full"
opt.wildmenu = true
opt.pumheight = 10
opt.pumblend = 0
opt.completeopt = { "menu", "menuone", "noselect" }


-- searching
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true


-- tabs / indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0
opt.shiftround = true
opt.smartindent = true


-- line wrapping
opt.wrap = true
opt.showbreak = "↪ "
opt.linebreak = true
opt.breakat = " 	!;:,./?"
opt.breakindent = true

    
-- line wrapping
opt.wrap = true
opt.showbreak = "↪ "
opt.linebreak = true
opt.breakat = " 	!;:,./?"
opt.breakindent = true
