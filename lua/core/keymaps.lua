-- This file denotes all the keymaps that we want to configure in the scope of the basic Neovim features
--
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable native macos navigation while in normal mode
vim.keymap.set('n', '<M-b>', '<cmd>echo "Use b to move to the previous word!!"<CR>')
vim.keymap.set('n', '<M-f>', '<cmd>echo "Use w to move to the next word!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- macos-like navigation in insert mode
vim.keymap.set('i', '<M-b>', '<C-o>b', { desc = 'Move to the beginning of the previous word in insert-mode' })
vim.keymap.set('i', '<M-f>', '<C-o>w', { desc = 'Move to the beginning of the next word in insert-mode' })

--
-- overseer task runner keymaps
--
vim.keymap.set('n', '<leader>mb', function()
  local overseer = require 'overseer'
  overseer.run_task { name = 'cmake:build' }
end, { desc = '[M]ake [B]uild (Overseer)' })

vim.keymap.set('n', '<leader>mt', function()
  local overseer = require 'overseer'
  overseer.run_task { name = 'ctest: run' }
end, { desc = '[M]ake [T]est (Overseer)' })

vim.keymap.set('n', '<leader>q', function()
  local win = vim.fn.getqflist({ winid = 0 }).winid
  if win ~= 0 then
    vim.cmd 'cclose'
  else
    vim.cmd 'copen'
  end
end, { desc = 'Quickfix toggle' })

vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Quickfix next' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'Quickfix prev' })
