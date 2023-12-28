local copilot_config = {
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
    -- following is commented because i want to use tab as accept
    -- view nvim-cmp.lua for more infom
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			-- accept = "<M-l>",
      accept = false,
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		-- yaml = true,
		-- markdown = true,
		-- help = false,
		-- gitcommit = false,
		-- gitrebase = false,
		-- hgcommit = false,
		-- svn = false,
		-- cvs = false,
		["*"] = true,
	},
	copilot_node_command = "node", -- Node.js version must be > 18.x
	server_opts_overrides = {},
}

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup(copilot_config)
	end,
}
