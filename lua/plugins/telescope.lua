return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		defaults = {
            preview = {
                -- Enable treesitter for preview
                treesitter = true
            }
        },
	}
}
