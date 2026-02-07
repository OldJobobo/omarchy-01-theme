return {
	{
		"xero/evangelion.nvim",
		priority = 1000,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "evangelion",
			overrides = {
				-- remove that orange cursor-word block
				LspReferenceText = { bg = "NONE" },
				LspReferenceRead = { bg = "NONE" },
				LspReferenceWrite = { bg = "NONE" },

				-- OR: use underline instead (comment the bg lines above if you do this)
				-- LspReferenceText  = { underline = true },
				-- LspReferenceRead  = { underline = true },
				-- LspReferenceWrite = { underline = true },
			},
		},
	},
}

-- return {
--     {
--         "bjarneo/aether.nvim",
--         branch = "v2",
--         name = "aether",
--         priority = 1000,
--         opts = {
--             transparent = false,
--             colors = {
--                 -- Background colors
--                 bg = "#1e142e",
--                 bg_dark = "#1e142e",
--                 bg_highlight = "#d99145",
--
--                 -- Foreground colors
--                 -- fg: Object properties, builtin types, builtin variables, member access, default text
--                 fg = "#ccd2d9",
--                 -- fg_dark: Inactive elements, statusline, secondary text
--                 fg_dark = "#875faf",
--                 -- comment: Line highlight, gutter elements, disabled states
--                 comment = "#d99145",
--
--                 -- Accent colors
--                 -- red: Errors, diagnostics, tags, deletions, breakpoints
--                 red = "#a1a0ad",
--                 -- orange: Constants, numbers, current line number, git modifications
--                 orange = "#a1a0ad",
--                 -- yellow: Types, classes, constructors, warnings, numbers, booleans
--                 yellow = "#87ff5f",
--                 -- green: Comments, strings, success states, git additions
--                 green = "#e6bb85",
--                 -- cyan: Parameters, regex, preprocessor, hints, properties
--                 cyan = "#ce67f0",
--                 -- blue: Functions, keywords, directories, links, info diagnostics
--                 blue = "#ab92fc",
--                 -- purple: Storage keywords, special keywords, identifiers, namespaces
--                 purple = "#a4d2ec",
--                 -- magenta: Function declarations, exception handling, tags
--                 magenta = "#a4d2ec",
--             },
--         },
--         config = function(_, opts)
--             require("aether").setup(opts)
--             vim.cmd.colorscheme("aether")
--
--             -- Enable hot reload
--             require("aether.hotreload").setup()
--         end,
--     },
--     {
--         "LazyVim/LazyVim",
--         opts = {
--             colorscheme = "aether",
--         },
--     },
-- }
