local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "smartpde/telescope-recent-files" },
	},
	commit = "74ce793a60759e3db0d265174f137fb627430355",
	lazy = true,
	cmd = "Telescope",
}

function M.config()
	local icons = require("user.icons")
	local actions = require("telescope.actions")

	require("telescope").load_extension("recent_files")
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = { "node_modules", ".git", ".cache", "vendor", "build" },
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" },
			sorting_strategy = nil,
			layout_strategy = nil,
			layout_config = {},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			recent_files = {
				only_cwd = true,
				path_display = { "shorten" },
				layout_config = {
					width = 0.25,
					height = 0.5,
					preview_width = 0.5,
				},
			},
		},
	})
end

return M
