return {
    disable_move = true,
    project = { limit = 4, icon = ' ', label = 'Project', action = 'Telescope find_files cwd=' },
    shortcut = {
      { desc = "📦 Packer Update", group = "DashboardShortCut", action = "PackerSync", key = "p" },
      { desc = "🍄 TS Update", group = "DashboardShortCut", action = "TSUpdate", key = "t" },
      { desc = "⚡ Startuptime", group = "DashboardShortCut", action = "StartupTime", key = "s" },
    },
    packages = { enable = false },
    header = {
      '                                                       ',
      '███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗',
      '████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝',
      '██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ',
      '██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ',
      '██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ',
      '╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ',
      "                                          ",
      "                                          ",
      "                                          ",
    },
    center = {
      {
        icon = '  ',
        desc = 'Recently latest session                 ',
        shortcut = 'SPC q l',
        action ='SessionLoad'
      },
      {
        icon = '  ',
        desc = 'Recently opened files                   ',
        action =  'DashboardFindHistory',
        shortcut = 'SPC f h'
      },
      {
        icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files',
        shortcut = 'SPC f f'
      },
      {
        icon = '  ',
        desc ='File Browser                            ',
        action =  'Telescope file_browser',
        shortcut = 'SPC f b'
      },
      {
        icon = '  ',
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f w'
      },
      {
        icon = '  ',
        desc = 'Open Neovim Config                      ',
        action = 'Telescope dotfiles path=~/.config/nvim',
        shortcut = 'SPC f d'
      },
    },
    footer = {
      '',
      'By Jesus\' Mercy',
    }
  }

