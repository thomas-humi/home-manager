require("packer").startup(function()
	use("L3MON4D3/LuaSnip")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("junegunn/fzf.vim")
	use("kosayoda/nvim-lightbulb")
	use("kyazdani42/nvim-web-devicons")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/cmp-rg")
	use({ "kamykn/spelunker.vim", opt = true, event = "WinEnter" })
	use({ "kamykn/popup-menu.nvim", opt = true, event = "WinEnter" })
	use("neoclide/jsonc.vim")
	use("neovim/nvim-lspconfig")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("norcalli/nvim-colorizer.lua")
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")
	use("onsails/lspkind-nvim")
	use("rafamadriz/friendly-snippets")
	use("ray-x/go.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("saadparwaiz1/cmp_luasnip")
	use("tpope/vim-abolish")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "ray-x/lsp_signature.nvim" })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup()
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				sort_case_insensitive = false, -- used when sorting files and directories in the tree
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						-- expander config, needed for nesting files
						with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "ﰊ",
						-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
						-- then these will never be used.
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
						highlight = "NeoTreeFileName",
					},
					git_status = {
						symbols = {
							-- Change type
							added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
							modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "right",
					width = 40,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
						},
						["<2-LeftMouse>"] = "open",
						["<cr>"] = "close_on_open",
						["S"] = "open_split",
						["s"] = "open_vsplit",
						-- ["S"] = "split_with_window_picker",
						-- ["s"] = "vsplit_with_window_picker",
						["t"] = "open_tabnew",
						["w"] = "open_with_window_picker",
						["C"] = "close_node",
						["z"] = "close_all_nodes",
						--["Z"] = "expand_all_nodes",
						["a"] = {
							"add",
							-- some commands may take optional config options, see `:h neo-tree-mappings` for details
							config = {
								show_path = "none", -- "none", "relative", "absolute"
							},
						},
						["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
						["d"] = "delete",
						["r"] = "rename",
						["y"] = "copy_to_clipboard",
						["x"] = "cut_to_clipboard",
						["p"] = "paste_from_clipboard",
						["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
						-- ["c"] = {
						--  "copy",
						--  config = {
						--    show_path = "none" -- "none", "relative", "absolute"
						--  }
						--}
						["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
						["q"] = "close_window",
						["R"] = "refresh",
						["?"] = "show_help",
						["<"] = "prev_source",
						[">"] = "next_source",
					},
				},
				nesting_rules = {},
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							--"node_modules"
						},
						hide_by_pattern = { -- uses glob style patterns
							--"*.meta"
						},
						never_show = { -- remains hidden even if visible is toggled to true
							--".DS_Store",
							--"thumbs.db"
						},
					},
					follow_current_file = true, -- This will find and focus the file in the active buffer every
					-- time the current file is changed while the tree is open.
					group_empty_dirs = false, -- when true, empty folders will be grouped together
					hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
					-- in whatever position is specified in window.position
					-- "open_current",  -- netrw disabled, opening a directory opens within the
					-- window like netrw would, regardless of window.position
					-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
					use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
					-- instead of relying on nvim autocmd events.
					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["D"] = "fuzzy_finder_directory",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["[g"] = "prev_git_modified",
							["]g"] = "next_git_modified",
						},
					},
					commands = {
						close_on_open = function(state)
							local node = state.tree:get_node()
							if require("neo-tree.utils").is_expandable(node) then
								state.commands["toggle_node"](state)
							else
								state.commands["open"](state)
								state.commands["close_window"](state)
								vim.cmd("normal! M")
							end
						end,
					},
				},
				buffers = {
					follow_current_file = true, -- This will find and focus the file in the active buffer every
					-- time the current file is changed while the tree is open.
					group_empty_dirs = true, -- when true, empty folders will be grouped together
					show_unloaded = true,
					window = {
						mappings = {
							["bd"] = "buffer_delete",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
						},
					},
				},
				git_status = {
					window = {
						position = "float",
						mappings = {
							["A"] = "git_add_all",
							["gu"] = "git_unstage_file",
							["ga"] = "git_add_file",
							["gr"] = "git_revert_file",
							["gc"] = "git_commit",
							["gp"] = "git_push",
							["gg"] = "git_commit_and_push",
						},
					},
				},
			})
		end,
	})
	use({
		"mrbjarksen/neo-tree-diagnostics.nvim",
		requires = "nvim-neo-tree/neo-tree.nvim",
		module = "neo-tree.sources.diagnostics", -- if wanting to lazyload
	})
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use("kmonad/kmonad-vim")
	use({ "stevearc/dressing.nvim" })
	use("takac/vim-hardtime")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("Afourcat/treesitter-terraform-doc.nvim")
	use({
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"lalitmee/browse.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

	use({
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					panel = {
						enabled = true,
						auto_refresh = true,
						keymap = {
							jump_prev = "[[",
							jump_next = "]]",
							accept = "<CR>",
							refresh = "gr",
							open = "<M-CR>",
						},
					},
				})
			end, 100)
		end,
	})

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				-- optional configuration
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use("aduros/ai.vim")
end)

local trouble = require("trouble.providers.telescope")
local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		multi_icon = "<>",
		path_display = { "truncate" },
		winblend = 0,
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.95,
			height = 0.85,
			prompt_position = "bottom",

			horizontal = {
				preview_width = function(_, cols, _)
					if cols > 200 then
						return math.floor(cols * 0.4)
					else
						return math.floor(cols * 0.6)
					end
				end,
			},

			vertical = {
				width = 0.9,
				height = 0.95,
				preview_height = 0.5,
			},

			flex = {
				horizontal = {
					preview_width = 0.9,
				},
			},
		},
		selection_strategy = "reset",
		sorting_strategy = "descending",
		scroll_strategy = "cycle",
		color_devicons = true,
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-h>"] = lga_actions.quote_prompt({ postfix = " -. " }),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")
require("telescope").load_extension("live_grep_args")

function find_files_all()
	require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end

require("colorizer").setup({ "*" })

local cmp = require("cmp")
local winhighlight = {
	winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Select,
		}),
		["<C-p>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Select,
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "rg", keyword_length = 3 },
		{ name = "path", keyword_length = 5 },
	},
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = false,
			maxwidth = 50,
		}),
	},
	experimental = { native_menu = false },
	window = {
		completion = cmp.config.window.bordered(winhighlight),
		documentation = cmp.config.window.bordered(winhighlight),
	},
})

require("lsp_signature").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		custom_captures = {
			-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
			["foo.bar"] = "Identifier",
		},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = enable,
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "gnn", -- maps in normal mode to init the node/scope selection
			node_incremental = "grn", -- increment to the upper named parent
			scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
			node_decremental = "grm", -- decrement to the previous node
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	context_commentstring = { enable = true, enable_autocmd = false },
})

require("go").setup()

require("todo-comments").setup({})

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

require("luasnip.loaders.from_vscode").lazy_load()

vim.diagnostic.config({
	update_in_insert = false,
	virtual_text = false,
})

require("refactoring").setup({})

require("catppuccin").setup({
	flavour = "frappe", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		neotree = true,
		treesitter_context = true,
		lsp_trouble = true,
	},
})

vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		theme = "catppuccin",
		-- ... the rest of your lualine config
	},
})
