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

    overseer.register_template {
      name = 'cmake: build',
      builder = function()
        return {
          cmd = { 'cmake', '--build', 'build', '-j' },
          components = {
            { 'on_output_quickfix', open = false },
            'default',
          },
        }
      end,

      condition = {
        callback = function()
          return vim.fs.find('CMakeLists.txt', { upward = true })[1] ~= nil
        end,
      },
    }

    overseer.register_template {
      name = 'ctest: run',
      builder = function()
        return {
          cmd = { 'ctest', '--test-dir', 'build', '--output-on-failure', '--progress' },
          components = {
            { 'on_output_quickfix', open = true },
            'default',
          },
        }
      end,

      condition = {
        callback = function()
          return vim.fs.find('CMakeLists.txt', { upward = true })[1] ~= nil
        end,
      },
    }
  end,
  keys = {
    { -- explicit toggle for task buffer
      '<leader>ot',
      '<cmd>OverseerToggle<CR>',
      desc = '[O]verseer [T]oggle',
    },

    --
    -- CMake keymaps
    --
    { -- Make build keymap for overseer task runner
      '<leader>mb',
      function()
        require('overseer').run_task { name = 'cmake: build' }
      end,
      desc = '[M]ake [B]uild (Overseer)',
    },
    { -- Make test using ctest testing process framework
      '<leader>mt',
      function()
        require('overseer').run_task { name = 'ctest: run' }
      end,
      desc = '[M]ake [T]est (Overseer)',
    },
  },
}
