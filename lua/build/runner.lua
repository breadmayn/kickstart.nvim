-- nvim build runner
--

local M = {}

-- open quickfix only if there are entries
local function open_qf_if_entries()
  local qf = vim.fn.getqflist()
  for _, item in ipairs(qf) do
    if item.type == 'E' then
      vim.cmd 'copen'
      return
    end
  end
end

-- Run ':make' (synchronous, but itegrates with quifix immediately)
-- 'args' appends to makeprg (works nicely when makeprg is 'cmake --build build')
function M.make(args)
  local extra = args and args ~= '' and (' ' .. args) or ''
  -- 'silent' reduces noise: remove if you want full command echo
  vim.cmd('silent make' .. extra)
  open_qf_if_entries()
end

-- set the project makeprg
function M.set_makeprg(cmd)
  vim.o.makeprg = cmd
end

function M.set_errorformat(efm)
  vim.o.errorformat = efm
end

-- convenience verbs
function M.build()
  M.make(nil)
end

function M.test()
  local testprg = vim.g.nvim_testprg
  if testprg and testprg ~= '' then
    -- temporarily override makrprg just for testing
    local old = vim.o.makeprg
    vim.o.makeprg = testprg

    local ok, err = pcall(M.make, nil)
    M.make(nil)
    if not ok then
      error(err)
    end

    vim.o.makeprg = old
    vim.cmd 'copen'
  else
    M.make 'test'
    vim.cmd 'cclose'
  end
end

return M
