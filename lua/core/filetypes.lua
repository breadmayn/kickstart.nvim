-- dictates filetype extrensions early in configuration (hopefully before lsp attaches)

vim.filetype.add {
  extension = {
    tpp = 'cpp',
  },
}
