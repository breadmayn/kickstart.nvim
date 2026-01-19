-- C ftplugin (pre-clangd LSP)
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

-- good default comment formatting: doesn't reflow code aggressively
vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
vim.opt_local.formatoptions:append { 'j' }
