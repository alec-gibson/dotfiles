local snippets = require'snippets'
local U = require'snippets.utils'

snippets.snippets = {
  lua = {};
  lisp = {};
  _global = {
    -- If you aren't inside of a comment, make the line a comment.
    copyright = U.force_comment [[Copyright (C) Alec Gibson ${=os.date("%Y")}]];
  };
}
