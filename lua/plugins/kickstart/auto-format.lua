return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    { -- format current buffer
      '<leader>f',
      function()
        require('conform').format {
          async = true,
          timeout_ms = 3000,
          lsp_format = 'never',
        }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    formatters = {
      clang_format = {
        condition = function(ctx)
          -- only use clang_format if formatting file exists
          -- :lua print(vim.bo.filetype, vim.api.nvim_buf_get_name(0), require("conform").get_formatter_info("clang_format", 0).available) - this is to check if clang-format is available in the current buffer
          -- :lua print(require("conform").get_context(0).dirname) - this finds the .clang-format formatting rules file
          return vim.fs.find({ '.clang-format', '_clang-format' }, { path = ctx.dirname, upward = true })[1] ~= nil
        end,
      },
    },
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'never',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },

      c = { 'clang_format' },
      cpp = { 'clang_format' },
      objc = { 'clang_format' },
      objcpp = { 'clang_format' },

      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
