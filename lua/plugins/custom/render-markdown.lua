-- render-markdown is a Neovim plugin which creates a frictionless integration of mark down rendering within the terminal with nvim
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {},
}
