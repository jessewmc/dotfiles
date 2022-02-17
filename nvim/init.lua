-- tabs -> spaces
vim.opt.expandtab = true
-- allow us to scroll so last line of file is anywhere in viewport
vim.opt.scrolloff = 999
-- show line numbers
vim.opt.number = true
-- make the gutter width for line numbers 5 digits
vim.opt.numberwidth = 5
-- show trailing things and other bad whitespace
vim.opt.list = true
vim.opt.listchars = "tab:»·,nbsp:+,trail:·"
-- make sure << and >> commands indent to multiple of shiftwidth
vim.opt.shiftround = true
-- visual ruler at 100 columns wide
set colorcolumn=100
--
