return {
	'lewis6991/gitsigns.nvim',
	opts = {
		on_attach = function(bufnr)
			local gs = require('gitsigns')

			local function map(lhs, rhs, desc)
				vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- Hunk navigation (chords)
			map('<C-j>', gs.next_hunk, 'Next hunk')
			map('<C-k>', gs.prev_hunk, 'Prev hunk')

			-- Git actions
			map('<leader>gs', gs.stage_hunk, 'Stage hunk')
			map('<leader>gu', gs.undo_stage_hunk, 'Unstage hunk')
			map('<leader>gp', gs.preview_hunk, 'Preview hunk')
			map('<leader>gb', gs.blame_line, 'Blame line')
			map('<leader>gd', gs.diffthis, 'Diff')
		end,
	},
}
