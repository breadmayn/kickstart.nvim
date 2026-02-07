-- overseer is a Neovim plugin that manages jobs run tasks
-- https://github.com/stevearc/overseer.nvim

return {
  'stevearc/overseer.nvim',
  cmd = {
    'OverseerRun',
    'OverseerToggle',
    'OverseerOpen',
  },
  opts = {},
  keys = {
    { -- build project with OverseerRun
      '<leader>or',
      '<cmd>OverseerRun<CR>',
      desc = 'Oversser: Run task',
    },
    { -- explicit toggle for task buffer
      '<leader>ot',
      '<cmd>OverseerToggle<CR>',
      desc = 'Oversser: Toggle',
    },
    { -- build project with cmake
      '<leader>cb',
      '<cmd>OverseerShell cmake --build build<CR>',
      desc = 'CMake: Build',
    },
    { -- build and configure project with cmake
      '<leader>cc',
      '<cmd>OverseerShell cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON<CR>',
      desc = 'CMake: Configure',
    },
  },
}
