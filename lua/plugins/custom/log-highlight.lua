-- log-highligh is a Neovim plugin that provide a robust log viewer
-- https://github.com/fei6409/log-highlight.nvim

return {
  'fei6409/log-highlight.nvim',
  ft = {
    'log',
  },
  opts = {
    extension = 'log', -- default
    filename = {
      'syslog', -- example from read me
    },
    pattern = {
      '%/var%/log%/.*',
      'console%-ramoops.*',
      'log.*%.txt',
      'logcat.*',
    },
    keyword = {
      error = { 'ERROR', 'FATAL', 'PANIC', 'CRITICAL' },
      warning = { 'WARN', 'WARNING' },
      info = { 'INFO', 'NOTICE' },
      debug = { 'DEBUG', 'TRACE' },
      pass = { 'PASS', 'OK', 'SUCCESS' },
    },
  },
}
