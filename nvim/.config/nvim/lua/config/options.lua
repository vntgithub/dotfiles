vim.g.mapleader = " "
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Alias vim.opt to 'opt' for cleaner code below
local opt = vim.opt

-- ==============================================================================
-- Editor Behavior
-- ==============================================================================
opt.autowrite = true                      -- Automatically save before executing commands
opt.clipboard = "unnamedplus"             -- Sync Neovim clipboard with system clipboard
opt.completeopt = "menu,menuone,noselect" -- Better autocompletion menu UI
opt.conceallevel = 2                      -- Hide markdown formatting markers (like *bold*)
opt.confirm = true                        -- Prompt to save instead of throwing an error when exiting
opt.formatoptions = "jcroqlnt"            -- Better default comment formatting
opt.ignorecase = true                     -- Ignore casing in searches...
opt.smartcase = true                      -- ...unless you use a capital letter
opt.inccommand = "nosplit"                -- Live preview of search/replace (e.g., %s/old/new)
opt.mouse = "a"                           -- Enable full mouse support
opt.timeoutlen = 300                      -- Wait time (ms) for mapped key sequences (makes WhichKey faster)
opt.undofile = true                       -- Save undo history to a file (undo after reopening!)
opt.updatetime = 200                      -- Faster hover events and swap file saving
opt.virtualedit = "block"                 -- Allow cursor to move past end of line in visual block mode
opt.swapfile = false

-- ==============================================================================
-- UI & Visuals
-- ==============================================================================
opt.cursorline = true     -- Highlight the line your cursor is currently on
opt.laststatus = 3        -- Use a single, global statusline at the bottom
opt.linebreak = true      -- Wrap long lines at words, not in the middle of a word
opt.list = true           -- Show invisible characters
opt.number = true         -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers for easier jumping
opt.scrolloff = 4         -- Keep 4 lines visible above/below cursor when scrolling
opt.sidescrolloff = 8     -- Keep 8 columns visible left/right when scrolling
opt.showmode = false      -- Hide "-- INSERT --" text (statusline usually handles this)
opt.signcolumn = "yes"    -- Always show the left gutter (prevents text shifting)
opt.splitbelow = true     -- Open horizontal splits below the current window
opt.splitright = true     -- Open vertical splits to the right of the current window
opt.termguicolors = true  -- Enable 24-bit true colors
opt.wrap = false          -- Disable line wrapping by default

-- ==============================================================================
-- Indentation & Tabs
-- ==============================================================================
opt.expandtab = true   -- Convert tabs to spaces
opt.shiftround = true  -- Round indentation to the nearest multiple of shiftwidth
opt.shiftwidth = 2     -- Number of spaces to use for each step of (auto)indent
opt.tabstop = 2        -- Number of spaces a <Tab> counts for
opt.smartindent = true -- Automatically insert the correct indentation on new lines

--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


local colors = {
  bg       = "#222D31",
  fg       = "#d8d8d8",
  selection = "#2B2C2B",
  teal     = "#1ABB9B", -- The signature Maia color
  green    = "#7E807E",
  red      = "#ab4642",
  yellow   = "#f7ca88",
  blue     = "#7cafc2",
  magenta  = "#ba8baf",
  grey     = "#585858",
}

local groups = {
  -- Base interface
  Normal       = { fg = colors.fg, bg = colors.bg },
  Visual       = { bg = colors.selection },
  CursorLine   = { bg = "#2d393e" },
  ColorColumn  = { bg = "#2d393e" },
  LineNr       = { fg = colors.grey },
  CursorLineNr = { fg = colors.teal, bold = true },
  
  -- Search and UI
  Search       = { fg = colors.bg, bg = colors.teal },
  VertSplit    = { fg = colors.selection, bg = colors.bg },
  StatusLine   = { fg = colors.fg, bg = colors.selection },
  
  -- Syntax Highlighting
  Comment      = { fg = colors.grey, italic = true },
  Constant     = { fg = colors.blue },
  String       = { fg = colors.yellow },
  Function     = { fg = colors.teal },
  Statement    = { fg = colors.magenta },
  Keyword      = { fg = colors.magenta },
  Type         = { fg = colors.teal },
  Identifier   = { fg = colors.fg },
  PreProc      = { fg = colors.yellow },
  Special      = { fg = colors.blue },
  Todo         = { fg = colors.bg, bg = colors.yellow, bold = true },
  
  -- TreeSitter (For modern Neovim)
  ["@variable"] = { fg = colors.fg },
  ["@function"]  = { fg = colors.teal },
  ["@keyword"]   = { fg = colors.magenta },
  ["@string"]    = { fg = colors.yellow },
}

-- Apply the colors
for group, settings in pairs(groups) do
  vim.api.nvim_set_hl(0, group, settings)
end
