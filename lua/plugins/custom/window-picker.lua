-- Window-picker is a Neovim plugin that makes window creation and management easier
-- https://github.com/s1n7ax/nvim-window-picker

return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  keys = {
    {
      '<leader>w',
      function()
        local win = require('window-picker').pick_window()
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end,
      desc = 'Focus window (pick)',
    },
    {
      '<leader>W',
      function()
        local win = require('window-picker').pick_window()
        if win then
          vim.api.nvim_win_set_buf(win, vim.api.nvim_get_current_buf())
        end
      end,
      desc = 'Send buffer to specified window',
    },
  },
  opts = {
    hint = 'floating-big-letter',
    selection_chars = 'FJDKSLA;CMRUEIWOQP',
    picker_config = {
      handle_mouse_click = false,
    },
    show_prompt = true,
    prompt_message = 'Pick window: ',
  },
}
