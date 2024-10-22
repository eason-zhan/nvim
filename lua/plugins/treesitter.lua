return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',  -- Automatically update parsers
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {
                'c',
                'cpp',
                'java',
            },
            highlight = {
                enable = true
            }

		}
	end,
}
