vim.g.mapleader = " "
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.o.winborder = "rounded"

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
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- ==============================================================================
-- Cursor-Inspired Palette (Based on your JSON)
-- ==============================================================================
local colors = {
  bg           = "#1e2127", -- editor.background
  bg_dark      = "#191c22", -- activityBar.background / sideBar.background
  bg_highlight = "#20242c", -- editorHoverWidget.background
  fg           = "#7b88a1", -- editor.foreground (soft blue-grey)
  fg_bright    = "#d8dee9", -- editorCursor.foreground / variable.other
  selection    = "#434c5e", -- editor.selectionBackground (with transparency)
  cursor_line  = "#2a2d35", -- editor.lineHighlightBackground

  -- Accent Colors
  cyan         = "#88c0d0", -- entity.name.function / button.background
  teal         = "#8fbcbb", -- entity.name.class
  green        = "#a3be8c", -- string
  red          = "#bf616a", -- editorError.foreground
  orange       = "#d08770", -- storage.type.annotation
  yellow       = "#ebcb8b", -- constant.character
  blue         = "#81a1c1", -- keyword / storage
  magenta      = "#b48ead", -- constant.numeric
  grey         = "#4c566a", -- editorLineNumber.foreground
  comment      = "#687692", -- comment foreground
}

local groups = {
  -- Core UI
  Normal       = { fg = colors.fg, bg = colors.bg },
  NormalFloat  = { fg = colors.fg_bright, bg = colors.bg_dark },
  FloatBorder  = { fg = "#272c36", bg = colors.bg_dark },
  CursorLine   = { bg = colors.cursor_line },
  Visual       = { bg = "#343b49" },
  LineNr       = { fg = colors.grey },
  CursorLineNr = { fg = "#687692", bold = true }, -- editorLineNumber.activeForeground

  -- Search & Selection
  Search     = { bg = "#848606", fg = "#ffffff"}, -- Mimics #88c0d0 with 40% opacity
  IncSearch  = { bg = "#5d818a", fg = "#ffffff"}, -- Mimics #88c0d0 with 60% opacity
  CurSearch  = { bg = "#5d818a", fg = "#ffffff"}, -- Current match (usually brighter)
  -- Split & Gutter
  WinSeparator = { fg = "#26292f" }, -- Solid equivalent of 5% white on #1e2127
  SignColumn   = { bg = colors.bg },
  EndOfBuffer  = { fg = colors.bg },

  -- Syntax (Standard)
  Comment      = { fg = colors.comment, italic = true },
  Constant     = { fg = colors.magenta },
  String       = { fg = colors.green },
  Character    = { fg = colors.yellow },
  Number       = { fg = colors.magenta },
  Boolean      = { fg = colors.magenta },
  Float        = { fg = colors.magenta },

  Identifier   = { fg = colors.fg_bright },
  Function     = { fg = colors.cyan },
  Statement    = { fg = colors.blue },
  Keyword      = { fg = colors.blue },
  PreProc      = { fg = "#5e81ac" }, -- meta.preprocessor
  Type         = { fg = colors.teal },
  Special      = { fg = colors.blue },
  Underlined   = { underline = true },
  Error        = { fg = colors.red },
  Todo         = { fg = colors.yellow, bold = true },

  -- TreeSitter (Neovim 0.8+)
  ["@variable"]           = { fg = colors.fg_bright },
  ["@variable.builtin"]   = { fg = colors.blue, italic = true },
  ["@function"]           = { fg = colors.cyan },
  ["@function.builtin"]   = { fg = colors.cyan },
  ["@keyword"]            = { fg = colors.blue },
  ["@keyword.operator"]   = { fg = colors.blue },
  ["@property"]           = { fg = colors.fg_bright },
  ["@field"]              = { fg = colors.fg_bright },
  ["@type"]               = { fg = colors.teal },
  ["@type.builtin"]       = { fg = colors.blue },
  ["@constant"]           = { fg = colors.magenta },
  ["@parameter"]          = { fg = colors.fg_bright },
  ["@punctuation.bracket"] = { fg = "#eceff4" },
  ["@punctuation.delimiter"] = { fg = "#eceff4" },
  ["@tag"]                = { fg = colors.blue },
  ["@tag.attribute"]      = { fg = colors.teal, italic = true },
  ["@attribute"]          = { fg = colors.orange },
}

-- Apply the colors
for group, settings in pairs(groups) do
  vim.api.nvim_set_hl(0, group, settings)
end
