vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.o.winborder = "rounded"

local opt = vim.opt

-- Editor Behavior
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.formatoptions = "jcroqlnt"
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.mouse = "a"
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 200
opt.virtualedit = "block"
opt.swapfile = false

-- UI & Visuals
opt.cursorline = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.showmode = false
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.wrap = false

-- Indentation & Tabs
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
