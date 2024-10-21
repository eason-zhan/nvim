return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
	},
	opts = {
		defaults = { preview = {
			treesitter = true -- Enable treesitter for preview
		} },
	}
}
