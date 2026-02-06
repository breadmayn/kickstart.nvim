-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function(_, opts)
    local npairs = require 'nvim-autopairs'
    npairs.setup {
      check_ts = true,
    }

    local Rule = require 'nvim-autopairs.rule'

    -- force block-comment pairing in C-family files
    npairs.add_rules {
      Rule('/*', '*/', { 'c', 'cpp', 'objc', 'objcpp' }),
    }
  end,
}
