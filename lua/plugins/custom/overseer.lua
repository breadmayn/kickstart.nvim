-- overseer is a Neovim plugin that manages jobs run tasks
-- https://github.com/stevearc/overseer.nvim

return {
  'stevearc/overseer.nvim',
  cmd = {
    'OverseerRun',
    'OverseerToggle',
    'OverseerOpen',
  },
  opts = {
    output = { use_terminal = true },
    task_list = { direction = 'bottom' },
  },

  -- do side effects (setup + template registration here)
  config = function(_, opts)
    local overseer = require 'overseer'
    overseer.setup(opts)

    require('build.templates').register_for_project()
  end,
  keys = {
    { -- explicit toggle for task buffer
      '<leader>ot',
      '<cmd>OverseerToggle<CR>',
      desc = '[O]verseer [T]oggle',
    },
    { -- explicit run (opens picker for which task to run)
      '<leader>or',
      '<cmd>OverseerRun<CR>',
      desc = '[O]verseer [R]un',
    },
  },
}
