-- this file defines C++ doc comment snippet for Luasnip

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- a doc-comment block similar to IDE behavior
return {
  s('doc', {
    t { '/**', ' *' },
    i(1, ' Description '),
    t { '', ' */' },
    i(0),
  }),
}
