local M = {}

M.cmp = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  return {
    -- confirm selection
    ["<CR>"] = cmp.mapping({
      i = cmp.mapping.confirm({ select = true }),
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = false }),
    }),

    -- toggle completion
    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
        fallback()
      else
        cmp.complete()
      end
    end, {
      "i",
      "s",
      "c",
    }),

    ["<C-j>"] = cmp.mapping(function()
      cmp.select_next_item()
    end, {
      "i",
      "s",
      "c",
    }),
    ["<C-k>"] = cmp.mapping(function()
      cmp.select_prev_item()
    end, {
      "i",
      "s",
      "c",
    }),

    -- scrol docs
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),

    -- snippet
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

return M
