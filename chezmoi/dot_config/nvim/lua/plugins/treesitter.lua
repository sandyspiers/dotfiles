local langs = {
	'bash',
	'lua',
	'python',
	'markdown',
	'yaml',
	'toml',
	'julia',
}

return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install(langs)
	end,
}
