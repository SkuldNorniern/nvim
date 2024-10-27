local opt = vim.opt

opt.mouse = "nv"
opt.title = true
opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.undofile = false
-- FEAT: LATER: Configure Undo File


opt.timeoutlen = 350
opt.updatetime = 1000

sessionoptions = {
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