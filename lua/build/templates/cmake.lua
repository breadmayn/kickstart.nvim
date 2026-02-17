-- lua/build/templates/cmake.lua
-- generic build system using cmake and ctest
local M = {}

function M.register(overseer)
  overseer.register_template {
    name = 'cmake: build',
    builder = function()
      return {
        cmd = {
          'cmake',
          '--build',
          'build',
          '-j',
        },
        components = {
          {
            'open_output',
            on_complete = 'always',
            focus = true,
          },
          {
            'on_output_quickfix',
            open = false,
            set_diagnostics = false,
          },
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
        cmd = {
          'ctest',
          '--test-dir',
          'build',
          '--output-on-failure',
          '--progress',
        },
        components = {
          {
            'open_output',
            on_complete = 'always',
            focus = true,
          },
          {
            'on_output_quickfix',
            open = false,
            set_diagnostics = false,
          },
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
end

return M
