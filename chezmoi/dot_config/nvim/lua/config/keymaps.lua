-- keymaps

-- Saner n/N: always forward/backward regardless of search direction
vim.keymap.set({ 'n', 'o' }, 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set({ 'n', 'o' }, 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Better j/k on wrapped lines
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Stay in visual mode when indenting
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Move lines up/down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Save
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save' })

-- Quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- Lazy plugin manager
vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Explorer
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, { desc = 'Explorer' })

-- Buffers
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Alternate buffer' })
vim.keymap.set('n', '<leader>bx', function() Snacks.bufdelete() end, { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Close other buffers' })
vim.keymap.set('n', '<leader>bi', function() Snacks.bufdelete.invisible() end, { desc = 'Close invisible buffers' })

-- Windows
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Vertical split', remap = true })
vim.keymap.set('n', '<leader>ws', '<C-W>s', { desc = 'Horizontal split', remap = true })
vim.keymap.set('n', '<leader>wx', '<C-W>c', { desc = 'Close window', remap = true })
vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = 'Close other windows' })

-- Window resize (chords)
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Folds
vim.keymap.set('n', '<leader>za', 'zM', { desc = 'Close all folds', remap = true })
vim.keymap.set('n', '<leader>zo', 'zR', { desc = 'Open all folds', remap = true })
vim.keymap.set('n', '<leader>zt', function() vim.opt.foldlevel = 1 end, { desc = 'Fold to top level' })
vim.keymap.set('n', '<leader>zm', function() vim.opt.foldlevel = 2 end, { desc = 'Fold to module level' })

-- Find (snacks picker)
vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New file' })
vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Help' })

-- Diagnostics
vim.keymap.set('n', '<C-n>', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<C-p>', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.setloclist() end, { desc = 'Document diagnostics' })
vim.keymap.set('n', '<leader>dw', function() vim.diagnostic.setqflist() end, { desc = 'Workspace diagnostics' })

-- Search / replace
vim.keymap.set('n', '<leader>ra', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace all (word under cursor)' })
vim.keymap.set('n', '<leader>rf', '*``cgn', { desc = 'Replace forward (repeat with .)' })
vim.keymap.set('n', '<leader>rb', '#``cgN', { desc = 'Replace backward (repeat with .)' })
vim.keymap.set('x', '<leader>rf', [[y/\V<C-R>=escape(@",'/\')<CR><CR>Ncgn]], { desc = 'Replace forward (selection)' })

-- UI toggles (snacks)
Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>ts')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>tw')
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>tr')
Snacks.toggle.diagnostics():map('<leader>td')
Snacks.toggle.zoom():map('<leader>wm')
Snacks.toggle.zen():map('<leader>tz')
if vim.lsp.inlay_hint then
	Snacks.toggle.inlay_hints():map('<leader>th')
end
