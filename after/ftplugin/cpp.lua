-- C ftplugin (pre-clangd editor behaviors
-- Purpose: editor typing behavior, not formatting or linting

-- prefer Vim's builtin C indent rules for predictable behavior
vim.bo.cindent = true

-- If anything sets indentexpr (treesitter indent, etc) disable it so cindent/cinoptions apply
vim.bo.indentexpr = ''

-- indentation width while editing
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

-- make backspace behave like an IDE
vim.opt_local.backspace = { 'indent', 'eol', 'start' }

-- formatting options
-- c: auto-wrap comments
-- r: continue comments
-- o: continue with o
-- q: allow gq formatting
-- l: don't break long code lines
-- j: clean comment joins
-- n: better numbered lists
-- t: automatic text wrapping (NOT COMMENTS like c)

vim.opt_local.formatoptions = vim.opt_local.formatoptions + 'ro'

-- access modifier indent tweak
vim.opt_local.cinoptions:append 'g0'
