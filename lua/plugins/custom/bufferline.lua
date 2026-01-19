-- Bufferline is a Neovim plugin that gives a persistient section that lists current buffers that are open similar to IDE functionality
-- https://github.com/akinsho/bufferline.nvim

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'none',
      diagnostics = 'nvim_lsp',

      show_buffer_icons = true,
      show_buffer_close_icons = true,

      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
  keys = {
    {
      '<leader>bn',
      '<cmd>BufferLineCycleNext<CR>',
      desc = 'Next buffer',
    },
    {
      '<leader>bp',
      '<cmd>BufferLineCyclePrev<CR>',
      desc = 'Prev buffer',
    },
    {
      '<leader>bd',
      '<cmd>BufferLinePickClose<CR>',
      desc = 'Choose buffer to close',
    },
  },
}
