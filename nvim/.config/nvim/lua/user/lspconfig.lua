local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  commit = "e49b1e90c1781ce372013de3fa93a91ea29fc34a",
  dependencies = {
    {
      "folke/neodev.nvim",
      commit = "b094a663ccb71733543d8254b988e6bebdbdaca4",
    },
    -- {
    --   "nvimtools/none-ls.nvim"
    -- }
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- keymap(bufnr, "n", "ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap(bufnr, "n", "<C-e>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap(bufnr, "n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  -- format
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

function M.config()
  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "tailwindcss",
    -- trying to add php
    "intelephense",
    -- "none-ls"
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    -- for format on save
    -- if server == "none-ls" then
    --   local null_ls = require("null-ls")
    --     null_ls.setup({
    --       on_attach = function(client, bufnr)
    --         if client.supports_method("textDocument/formatting") then
    --           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --           vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --               vim.lsp.buf.format()
    --             end,
    --           })
    --         end
    --       end,
    --       sources = {
    --         null_ls.builtins.formatting.stylua,
    --         null_ls.builtins.diagnostics.eslint,
    --         null_ls.builtins.completion.spell,
    --         }
    --     })
    -- end

    lspconfig[server].setup(opts)
  end
end

return M
