-- Window-picker is a Neovim plugin that makes window creation and management easier
-- https://github.com/s1n7ax/nvim-window-picker

return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
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
