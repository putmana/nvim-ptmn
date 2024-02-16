local everforest = {
	'neanias/everforest-nvim',
	lazy = false,
	priority = 1000,
	name = 'everforest',
	background = 'hard',
	config = function()
		require('everforest').setup {
			background = 'hard',
		}

		vim.cmd.colorscheme 'everforest'
	end,
}

return everforest
