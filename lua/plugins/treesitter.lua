return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',  -- Automatically update parsers
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {
                'c',
                'cpp',
                'java',
                'javascript',
                'jq',
                'json',
                'rust',
                'tmux',
                'tsx',
            },
            highlight = {
                enable = true
            }

		}
	end,
}
