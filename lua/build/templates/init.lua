-- lua/build/templates/init.lua

local M = {}

local function has_upward(name)
  return vim.fs.find(name, { upward = true })[1] ~= nil
end

local function has_local(path)
  return vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1
end

function M.register_for_project()
  local overseer = require 'overseer'

  -- cmake projects
  if has_upward 'CMakeLists.txt' then
    require('build.templates.cmake').register(overseer)
  end
end

return M
