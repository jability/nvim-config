return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- local settings = require("core.settings")
		require("nvim-treesitter.configs").setup({
			--   ensure_installed = settings.treesitter_ensure_installed,
			--   ignore_install = {}, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
			indent = { enable = true },
			autopairs = { enable = true },
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["ib"] = "@block.inner",
						["ab"] = "@block.outer",
						["ir"] = "@parameter.inner",
						["ar"] = "@parameter.outer",
					},
				},
			},
		})
	end,
}
