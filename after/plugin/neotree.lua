require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        untracked = "?",
      }
    }
  },
  source_selector = {
    winbar = true,
    statusline = true
  },
  popup_border_style = "rounded",
  window = {
    width = 35,
    mappings = {
      ["<space>"] = "none",
      ["w"] = "open_with_window_picker",
    }
  },
  filesystem = {
    find_by_full_path_words = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git",
        ".vscode",
        ".idea",
        "build",
        "dist",
        ".next",
        ".astro",
        ".bookmarks"
      },
    } 
  },
})

-- vim.cmd("hi NeoTreeNormal guibg=#0a0e10")
-- vim.cmd("hi NeoTreeNormalNC guibg=#0a0e10")
-- vim.cmd("hi NeoTreeTitleBar guibg=NONE guifg=white")
-- vim.cmd("hi NeoTreeGitUnstaged gui=NONE guifg=#e55561")
