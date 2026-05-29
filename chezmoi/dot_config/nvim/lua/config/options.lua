local opt = vim.opt

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false -- lualine already shows the mode
opt.ruler = false -- lualine already shows position
opt.laststatus = 3 -- single global statusline instead of one per window
opt.signcolumn = "yes" -- always reserve space for signs; prevents layout shifts
opt.scrolloff = 4 -- keep 4 lines visible above/below cursor
opt.sidescrolloff = 8 -- keep 8 columns visible left/right of cursor
opt.pumheight = 10 -- max lines in completion popup
opt.wrap = false
opt.linebreak = true -- when wrap is enabled, break at word boundaries not mid-word
opt.smoothscroll = true -- scroll by screen lines rather than file lines when wrapping
opt.conceallevel = 2 -- hide markup characters (e.g. * in markdown), show substitutions

-------------------------------------------------------------------------------
-- Editing
-------------------------------------------------------------------------------

opt.expandtab = true -- spaces instead of tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true -- round indents to nearest shiftwidth multiple
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true -- override ignorecase when search contains uppercase
opt.confirm = true -- ask to save instead of erroring on unsaved-buffer exit
opt.autowrite = true -- auto-save when switching buffers, running commands, etc.
opt.mouse = "a"
opt.virtualedit = "block" -- allow cursor past end of line in visual block mode

-------------------------------------------------------------------------------
-- Search / substitution
-------------------------------------------------------------------------------

opt.inccommand = "nosplit" -- show live preview of :s substitutions in the buffer
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------

opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen" -- keep text on screen stable when splitting/closing windows

-------------------------------------------------------------------------------
-- Performance
-------------------------------------------------------------------------------

opt.updatetime = 200 -- ms before CursorHold fires; affects gitsigns, LSP hints
opt.timeoutlen = 300 -- ms to wait for a key sequence; lower = which-key shows faster

-------------------------------------------------------------------------------
-- Clipboard
-------------------------------------------------------------------------------

-- Use system clipboard, but not over SSH (where OSC 52 handles it instead)
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"

-------------------------------------------------------------------------------
-- Spelling
-------------------------------------------------------------------------------

opt.spelllang = { "en" }
