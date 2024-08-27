return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      },
    }
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
	{
    "neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
		opts = {
      diagnostics = {
        virtual_text = false,
        signs = false,
      },
		},
    config = function()
			require("cmp_nvim_lsp")
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
	
	--autocomplition
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},

	{
		"onsails/lspkind.nvim",
		config = function()
				require('lspkind').init({
						-- Configurações opcionais do lspkind
						-- Você pode adicionar mais configurações aqui se desejar
						mode = 'symbol_text',  -- Mostra ícones e texto
						preset = 'default',    -- Usa o preset padrão
						symbol_map = {
								Text = "",
								Method = "ƒ",
								Function = "",
								Constructor = "",
								Field = "ﰠ",
								Variable = "",
								Class = "ﴯ",
								Interface = "",
								Module = "",
								Property = "",
								Unit = "",
								Value = "",
								Enum = "了",
								Keyword = "",
								Snippet = "﬌",
								Color = "",
								File = "",
								Reference = "",
								Folder = "",
								EnumMember = "",
								Constant = "",
								Struct = "",
								Event = "",
								Operator = "ﬦ",
								TypeParameter = ""
						},
				})
		end
	},
}

--[[ return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
		
  {
    "neovim/nvim-lspconfig",
		opts = {
      diagnostics = {
        virtual_text = false,
        signs = false,
      },
		},
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  
  {
   "williamboman/mason.nvim",
   opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
      "prettier",
      "tsserver",
    },
   },
  },
  
  {
   "nvim-treesitter/nvim-treesitter",  
    opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "typescript",
    },
   },
  },
} ]]
