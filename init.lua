local map = vim.keymap.set

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map({ "i", "n", "v" }, "<M-BS>", "<esc>diwa")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- buffers
map({ "n", "i", "v" }, "<M-s>", "<ESC><cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- Copy and Paste
map("v", "yc", '"+yi', { noremap = true, desc = "Copy text to system clipboard" })
map("v", "yx", '"+c', { noremap = true, desc = "Cut text to system clipboard" })
map("n", "pv", '"+p', { noremap = true, desc = "Paste from system clipboard" })
map("v", "pv", 'c<ESC>"+p', { noremap = true, desc = "Paste from system clipboard" })
map("i", "<M-v>", '<ESC>"+pa', { noremap = true, desc = "Paste from system clipboard" })
map("n", 'pp', "p", { noremap = true, desc = "Paste from clipboard" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

map('v', '<leader>lF', vim.lsp.buf.code_action)

return {
  colorscheme = "abeldark",
  lsp = {
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
    },
  },
  plugins = {
    {
      "abel3t/abeltheme",
      name = "abeltheme",
      config = function() require("abeltheme").setup {} end,
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)      -- override the options using lazy.nvim
        opts.section.header.val = { -- change the header section value
          '                                                       ',
          ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
          ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
          ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
          ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
          ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
          ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
          "                    By Jesus' Mercy                    ",
          '                                                       ',
        }
      end,
    },
    { 'mg979/vim-visual-multi', branch = 'master' },
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        handlers = {
          python = function(source_name)
            local dap = require "dap"
            dap.adapters.python = {
              type = "executable",
              command = "/usr/bin/python3",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }

            dap.configurations.python = {
              {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- This configuration will launch the current file if used.
              },
            }
          end,
        },
      },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      enable = true,
      config = function()
        vim.opt.list = true
        vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"
        require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
          show_current_context_start = true,
        }
      end
    },
    {
      "NvChad/nvim-colorizer.lua",
      -- lazy = false,
      config = function()
        require("colorizer").setup {
          filetypes = { "*" },
          user_default_options = {
            RGB = true,          -- #RGB hex codes
            RRGGBB = true,       -- #RRGGBB hex codes
            names = true,        -- "Name" codes like Blue or blue
            RRGGBBAA = false,    -- #RRGGBBAA hex codes
            AARRGGBB = false,    -- 0xAARRGGBB hex codes
            rgb_fn = false,      -- CSS rgb() and rgba() functions
            hsl_fn = false,      -- CSS hsl() and hsla() functions
            css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
            -- Available modes for `mode`: foreground, background,  virtualtext
            mode = "background", -- Set the display mode.
            -- Available methods are false / true / "normal" / "lsp" / "both"
            -- True is same as normal
            tailwind = false,                                -- Enable tailwind colors
            -- parsers can contain values used in |user_default_options|
            sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
            javascript = true,
            typescript = true,
            virtualtext = "■",
            -- update color values even if buffer is not focused
            -- example use: cmp_menu, cmp_docs
            always_update = false
          },
          -- all the sub-options of filetypes apply to buftypes
          buftypes = {},
        }
      end
    },
    {
      "abel3t/bookmarks.nvim",
      name = "bookmarks",
      enabled = true,
      lazy = false,
      config = function()
        require('bookmarks').setup {
          -- sign_priority = 8,  --set bookmark sign priority to cover other sign
          save_file = vim.fn.expand "$HOME/.config/nvim/lua/user/.bookmarks", -- bookmarks save file path
          keywords = {
            ["@t"] = "☑️ ",                                               -- mark annotation startswith @t ,signs this icon as `Todo`
            ["@w"] = "⚠️ ",                                               -- mark annotation startswith @w ,signs this icon as `Warn`
            ["@f"] = "⛏ ",                                                  -- mark annotation startswith @f ,signs this icon as `Fix`
            ["@n"] = " ",                                                  -- mark annotation startswith @n ,signs this icon as `Note`
          },
          on_attach = function(bufnr)
            local bm = require "bookmarks"
            map("n", "mm", bm.bookmark_toggle, { desc = "Bookmark toggle" })     -- add or remove bookmark at current line
            map("n", "mi", bm.bookmark_ann)                                      -- add or edit mark annotation at current line
            map("n", "mc", bm.bookmark_clean)                                    -- clean all marks in local buffer
            map("n", "mn", bm.bookmark_next, { desc = "Jump to next Bookmark" }) -- jump to next mark in local buffer
            map("n", "mp", bm.bookmark_prev)                                     -- jump to previous mark in local buffer
            map("n", "ml", bm.bookmark_list)                                     -- show marked file list in quickfix window
            map("n", "mx", '<C-j><cmd>q<cr>') 
          end
        }
      end
    }, {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm                         = {
          enable = false
        },
      }
    end
  },
    {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require 'nvim-treesitter.configs'.setup {
          -- A list of parser names, or "all" (the five listed parsers should always be installed)
          ensure_installed = { "lua", "vim", "vimdoc", "query", 'javascript', 'typescript' },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          -- List of parsers to ignore installing (for "all")
          ignore_install = {},

          ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
          -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

          highlight = {
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
              local max_filesize = 1000 * 1024 -- 1000 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                return true
              end
            end,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = { 'org' },
          },
        }
      end
    },
    {
      'nvim-orgmode/orgmode',
      lazy = false,
      enable = true,
      config = function()
        require('orgmode').setup {}
        require('orgmode').setup_ts_grammar()
        require('cmp').setup({
          sources = {
            { name = 'orgmode' }
          }
        })
        require('orgmode').setup({
          org_agenda_files = { '$HOME/org/*' },
          org_default_notes_file = '$HOME/org/refile.org',
        })
      end
    }
  }
}
