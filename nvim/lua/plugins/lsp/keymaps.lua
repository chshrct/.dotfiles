local M = {}

M.lsp = function(event)
  vim.keymap.set(
    "n",
    "<leader>lr",
    vim.lsp.buf.rename,
    { buffer = event.buf, desc = "[l]sp: [r]ename" }
  )
  vim.keymap.set(
    "n",
    "<leader>la",
    vim.lsp.buf.code_action,
    { buffer = event.buf, desc = "[l]sp: [a]ction" }
  )
  vim.keymap.set(
    "n",
    "gd",
    ":Trouble lsp_definitions<CR>",
    { buffer = event.buf, desc = "lsp: [g]oto [d]efinition", silent = true }
  )
  vim.keymap.set(
    "n",
    "gr",
    ":Trouble lsp_references<CR>",
    { buffer = event.buf, desc = "lsp: [g]oto [r]eferences", silent = true }
  )
  vim.keymap.set(
    "n",
    "gI",
    ":Trouble lsp_implementations<CR>",
    { buffer = event.buf, desc = "lsp: [g]oto [I]mplementation", silent = true }
  )
  vim.keymap.set(
    "n",
    "<leader>D",
    ":Trouble lsp_type_definitions<CR>",
    { buffer = event.buf, desc = "lsp: type [D]efinition", silent = true }
  )
  vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", {
    buffer = event.buf,
    desc = "lsp: [d]ocument [s]ymbols",
    silent = true,
  })
  vim.keymap.set(
    "n",
    "<leader>ws",
    ":Telescope lsp_dynamic_workspace_symbols<CR>",
    { buffer = event.buf, desc = "lsp: [w]orkspace [S]ymbols", silent = true }
  )

  -- See `:help K` for why this keymap
  vim.keymap.set(
    "n",
    "K",
    vim.lsp.buf.hover,
    { buffer = event.buf, desc = "lsp: hover documentation" }
  )
  vim.keymap.set(
    { "n", "i" },
    "<C-k>",
    vim.lsp.buf.signature_help,
    { buffer = event.buf, desc = "lsp: signature documentation" }
  )

  -- Lesser used LSP functionality
  vim.keymap.set(
    "n",
    "gD",
    vim.lsp.buf.declaration,
    { buffer = event.buf, desc = "lsp: [g]oto [D]eclaration" }
  )
  vim.keymap.set(
    "n",
    "<leader>wa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = event.buf, desc = "lsp: [w]orkspace [a]dd folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = event.buf, desc = "lsp: [w]orkspace [r]emove folder" }
  )
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = event.buf, desc = "lsp: [w]orkspace [l]ist folders" })
end

M.format = function(conform)
  vim.keymap.set("n", "<leader>lf", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end, { desc = "[l]sp: [f]ormat" })
end

return M
