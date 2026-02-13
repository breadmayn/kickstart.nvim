-- kanagawa colorscheme
-- https://github.com/rebelot/kanagawa.nvim

return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = {
        italic = true,
      },
      functionStyle = {},
      keywordStyle = {
        italic = true,
      },
      statementStyle = {
        bold = true,
      },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window ':hl-NormalNC'
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {},
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = 'wave',
      background = {
        dark = 'wave',
        light = 'lotus',
      },
    }

    vim.cmd 'colorscheme kanagawa'
  end,
}
