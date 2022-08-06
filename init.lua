-- https://github.com/datamonsterr/astronvim_config/blob/main/mappings.lua
-- https://github.com/thieung/dotfiles/blob/main/config/nvim/mappings.lua

local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  header = {
    "       It’s not a bug,",
    "it’s an undocumented feature.",
  },

  -- Set colorscheme
  colorscheme = "onedark",

  -- Override highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides
    --   Normal = { bg = "#000000" },
    -- },
    default_theme = function(highlights) -- or a function that returns one
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = false,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      { "joshdick/onedark.vim" },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = {
        "dockerfile",
        "graphql",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "markdown",
        "sql",
        "tsx",
        "typescript",
        "yaml",
      },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = {
      ensure_installed = {
        "dockerls",
        "eslint",
        "graphql",
        "jdtls",
        "quick_lint_js",
        "jsonls",
        "marksman",
        "sqlls",
        "tsserver",
        "yamlls",
      },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = {
      ensure_installed = {
        "prettier",
        "stylua",
      },
    },
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },

    feline = function(config)
      local status = require "core.status"
      local hl = status.hl
      local provider = status.provider
      local conditional = status.conditional
      local C = require "default_theme.colors"

      config.components = {
        active = {
          {
            { provider = provider.spacer(), hl = hl.mode() },
            { provider = provider.spacer(2) },
            { provider = "git_branch", hl = hl.fg("Conditional", { fg = C.purple_1, style = "bold" }), icon = " " },
            { provider = provider.spacer(3), enabled = conditional.git_available },
            {
              provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } },
              enabled = conditional.has_filetype,
            },
            { provider = provider.spacer(2), enabled = conditional.has_filetype },
            { provider = "git_diff_added", hl = hl.fg("GitSignsAdd", { fg = C.green }), icon = "  " },
            { provider = "git_diff_changed", hl = hl.fg("GitSignsChange", { fg = C.orange_1 }), icon = " 柳" },
            { provider = "git_diff_removed", hl = hl.fg("GitSignsDelete", { fg = C.red_1 }), icon = "  " },
            { provider = provider.spacer(2), enabled = conditional.git_changed },
            { provider = "diagnostic_errors", hl = hl.fg("DiagnosticError", { fg = C.red_1 }), icon = "  " },
            { provider = "diagnostic_warnings", hl = hl.fg("DiagnosticWarn", { fg = C.orange_1 }), icon = "  " },
            { provider = "diagnostic_info", hl = hl.fg("DiagnosticInfo", { fg = C.white_2 }), icon = "  " },
            { provider = "diagnostic_hints", hl = hl.fg("DiagnosticHint", { fg = C.yellow_1 }), icon = "  " },
          },
          {
            { provider = provider.lsp_progress, enabled = conditional.bar_width() },
            {
              provider = provider.lsp_client_names(true),
              short_provider = provider.lsp_client_names(),
              enabled = conditional.bar_width(),
              icon = "   ",
            },
            { provider = provider.spacer(2), enabled = conditional.bar_width() },
            {
              provider = provider.treesitter_status,
              enabled = conditional.bar_width(),
              hl = hl.fg("GitSignsAdd", { fg = C.green }),
            },
            { provider = provider.spacer(2) },
            { provider = provider.spacer(), hl = hl.mode() },
          },
        },
      }
      return config
    end,
    -- END PLUGINS
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      --"dockerls",
      --"eslint",
      --"graphql",
      --"jdtls",
      --"quick_lint_js",
      --"jsonls",
      --"marksman",
      --"sqlls",
      --"tsserver",
      --"yamlls"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      --["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      --["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      --["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      --["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

      -- disable default bindings
      --["<C-Down>"] = false,
      --["<C-Left>"] = false,
      --["<C-Right>"] = false,
      --["<C-Up>"] = false,
      ["<leader>c"] = false, --
      ["<leader>d"] = false,
      ["<leader>h"] = false,
      ["<leader>o"] = false,
      ["<leader>fh"] = false, --
      ["<leader>fn"] = false,
      ["<leader>fo"] = false, --
      ["<leader>gt"] = false,
      ["<leader>li"] = false,
      ["<leader>lI"] = false,
      ["<leader>sb"] = false,
      ["<leader>sc"] = false, --
      ["<leader>sh"] = false, --
      ["<leader>sk"] = false, --
      ["<leader>sm"] = false, --
      ["<leader>sn"] = false, --
      ["<leader>sh"] = false, --
      ["<leader>sr"] = false, --
      ["<leader>pc"] = false,
      ["<leader>pi"] = false,
      ["<leader>ps"] = false,
      ["<leader>pS"] = false,
      ["<leader>pu"] = false,
      ["<b"] = false,
      [">b"] = false,

      -- resize with arrows
      --["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
      --["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
      --["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
      --["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },

      -- easy splits
      --["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
      --["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },

      -- better increment/decrement
      --["-"] = { "<c-x>", desc = "Descrement number" },
      --["+"] = { "<c-a>", desc = "Increment number" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          --["b"] = { name = "Buffer" },
          --["c"] = { function() MiniBufremove.delete() end, "Bye Buffer" },
          ["bc"] = { "<cmd>bdelete<cr>", "Close Buffer" },
          ["bn"] = { "<cmd>tabnew<cr>", "New Buffer" },
          --["ht"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
          --["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
          --["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
          --["r"] = { "<cmd>SendHere<cr>", "Set REPL" },
          --["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },

          f = {
            name = "Telescope",
            ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
            ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
            --B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            --e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
            h = { "<cmd>Telescope oldfiles<cr>", "History" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
            m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            --M = { "<cmd>Telescope media_files<cr>", "Media" },
            n = { "<cmd>Telescope notify<cr>", "Notifications" },
            p = { "<cmd>Telescope project<cr>", "Projects" },
            r = { "<cmd>Telescope registers<cr>", "Registers" },
            -- s = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Symbols" },
            t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
          },

          g = {
            name = "Telescope",
            s = { "<cmd>Telescope git_status<cr>", "Git status" },
          },

          -- h = {
          --   name = "Hop",
          --   c = { "<cmd>HopChar1<cr>", "Character" },
          --   C = { "<cmd>HopChar2<cr>", "2 Characters" },
          --   l = { "<cmd>HopLine<cr>", "Line" },
          --   p = { "<cmd>HopPattern<cr>", "Pattern" },
          --   w = { "<cmd>HopWord<cr>", "Word" },
          -- },
        },

        -- END MAPPINGS - NORMAL
      },

      -- v = {
      --   ["<leader>"] = {
      --     h = {
      --       name = "Hop",
      --       c = { "<cmd>HopChar1<cr>", "Character" },
      --       C = { "<cmd>HopChar2<cr>", "2 Characters" },
      --       l = { "<cmd>HopLine<cr>", "Line" },
      --       p = { "<cmd>HopPattern<cr>", "Pattern" },
      --       w = { "<cmd>HopWord<cr>", "Word" },
      --     },
      --   },
      -- },
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
