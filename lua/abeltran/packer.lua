vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- colorscheme and icons
    use 'navarasu/onedark.nvim'
    use("nvim-tree/nvim-web-devicons")
    
    -- files
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {'lewis6991/gitsigns.nvim' -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {
        'tomasky/bookmarks.nvim',
        -- tag = 'release' -- To use the latest release
    }
     
    
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup {}
        end
    }
    use("nvim-treesitter/playground")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context")
    use 'rcarriga/nvim-notify'

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                disable_filetype = {"TelescopePrompt"}
            }
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = { -- LSP Support
        {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'}, -- Snippets
        {'L3MON4D3/LuaSnip'}, {'rafamadriz/friendly-snippets'}}
    }

    use("folke/zen-mode.nvim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"}
    }

    use("norcalli/nvim-colorizer.lua")

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                config = {
                    disable_move = true,
                    project = {
                        limit = 4,
                        icon = ' ',
                        label = 'Project',
                        action = 'Telescope find_files cwd='
                    },
                    shortcut = {{
                        desc = "📦 Packer Update",
                        group = "DashboardShortCut",
                        action = "PackerSync",
                        key = "p"
                    }, {
                        desc = "🍄 TS Update",
                        group = "DashboardShortCut",
                        action = "TSUpdate",
                        key = "t"
                    }, {
                        desc = "⚡ Startuptime",
                        group = "DashboardShortCut",
                        action = "StartupTime",
                        key = "s"
                    }},
                    packages = {
                        enable = false
                    },
                    header = {"                                                     ",
                              "                                                     ",
                              "                                                     ",
                              "                                                     ",
                              "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                              "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                              "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                              "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                              "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                              "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                              "                                                     ",
                              "                                                     ",
                              "                                                     "},
                    center = {{
                        icon = '  ',
                        desc = 'Recently latest session                 ',
                        shortcut = 'SPC q l',
                        action = 'SessionLoad'
                    }, {
                        icon = '  ',
                        desc = 'Recently opened files                   ',
                        action = 'DashboardFindHistory',
                        shortcut = 'SPC f h'
                    }, {
                        icon = '  ',
                        desc = 'Find  File                              ',
                        action = 'Telescope find_files',
                        shortcut = 'SPC f f'
                    }, {
                        icon = '  ',
                        desc = 'File Browser                            ',
                        action = 'Telescope file_browser',
                        shortcut = 'SPC f b'
                    }, {
                        icon = '  ',
                        desc = 'Find  word                              ',
                        action = 'Telescope live_grep',
                        shortcut = 'SPC f w'
                    }, {
                        icon = '  ',
                        desc = 'Open Neovim Config                      ',
                        action = 'Telescope dotfiles path=~/.config/nvim',
                        shortcut = 'SPC f d'
                    }},
                    footer = {'', ' 🔥--test---🔥 '}
                }
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                plugins = {
                    marks = true, -- shows a list of your marks on ' and `
                    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                    -- No actual key bindings are created
                    spelling = {
                        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                        suggestions = 20 -- how many suggestions should be shown in the list?
                    },
                    presets = {
                        operators = true, -- adds help for operators like d, y, ...
                        motions = true, -- adds help for motions
                        text_objects = true, -- help for text objects triggered after entering an operator
                        windows = true, -- default bindings on <c-w>
                        nav = true, -- misc bindings to work with windows
                        z = true, -- bindings for folds, spelling and others prefixed with z
                        g = true -- bindings for prefixed with g
                    }
                },
                -- add operators that will trigger motion and text object completion
                -- to enable all native operators, set the preset / operators plugin above
                operators = {
                    gc = "Comments"
                },
                key_labels = {
                    -- override the label used to display some keys. It doesn't effect WK in any other way.
                    -- For example:
                    -- ["<space>"] = "SPC",
                    -- ["<cr>"] = "RET",
                    -- ["<tab>"] = "TAB",
                },
                motions = {
                    count = true
                },
                icons = {
                    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                    separator = "➜", -- symbol used between a key and it's label
                    group = "+" -- symbol prepended to a group
                },
                popup_mappings = {
                    scroll_down = "<c-d>", -- binding to scroll down inside the popup
                    scroll_up = "<c-u>" -- binding to scroll up inside the popup
                },
                window = {
                    border = "none", -- none, single, double, shadow
                    position = "bottom", -- bottom, top
                    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
                    padding = {1, 2, 1, 2}, -- extra window padding [top, right, bottom, left]
                    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                    zindex = 1000 -- positive value to position WhichKey above other floating windows.
                },
                layout = {
                    height = {
                        min = 4,
                        max = 25
                    }, -- min and max height of the columns
                    width = {
                        min = 20,
                        max = 50
                    }, -- min and max width of the columns
                    spacing = 3, -- spacing between columns
                    align = "left" -- align columns left, center or right
                },
                ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
                hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua "}, -- hide mapping boilerplate
                show_help = true, -- show a help message in the command line for using WhichKey
                show_keys = true, -- show the currently pressed key and its label as a message in the command line
                -- triggers = "auto", -- automatically setup triggers
                -- triggers = {"<leader>"} -- or specifiy a list manually
                -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
                triggers_nowait = { -- marks
                "`", "'", "g`", "g'", -- registers
                '"', "<c-r>", -- spelling
                "z="},
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for keymaps that start with a native binding
                    i = {"j", "k"},
                    v = {"j", "k"}
                },
                -- disable the WhichKey popup for certain buf types and file types.
                -- Disabled by default for Telescope
                disable = {
                    buftypes = {},
                    filetypes = {}
                }
            }
        end
    }

    -- Lua
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- Manual mode doesn't automatically change your root directory, so you have
                -- the option to manually do so using `:ProjectRoot` command.
                manual_mode = false,
              
                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },
              
                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
              
                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},
              
                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},
              
                -- Show hidden files in telescope
                show_hidden = false,
              
                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,
              
                -- What scope to change the directory, valid options are
                -- * global (default)
                -- * tab
                -- * win
                scope_chdir = 'global',
              
                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"),
              }
        end
    }
end)

