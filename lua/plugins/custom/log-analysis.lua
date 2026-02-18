-- candela is a Neovim plugin that attempts to replicate the Log Analysis VSCode extension
-- https://github.com/KieranCanter/candela.nvim

return {
  'KieranCanter/candela.nvim',
  cmd = { 'Candela' }, -- lazy-load when you run :Candela
  opts = {
    engine = {
      command = 'rg', -- or nil to auto pick find command (prefering ripgrep for now)
      args = {},
    },
    matching = {
      case = 'system', -- sync with nvim ignorecase and smartcase settings
      hl_eol = true, -- highlight to end of line
      auto_refresh = false,
    },
    syntax_highlighting = {
      enabled = true,
      file_types = { '.log', 'log', 'text' },
    },
  },
  -- lightbox defaults are usually fine; optional:
  -- lightbox = { view = 'system-vsplit, fold_style = 'nvim' }
}
