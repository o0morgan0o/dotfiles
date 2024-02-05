local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


 lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  -- on_attach = require('lsp').common_on_attach,
  filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'markdown', 'php', 'blade', 'twig', 'vue' },
  init_options = {
    html = {
      options = {
      -- https://www.cdl-group.co.uk/wp-content/uploads/2014/11/cta-2.jpg 300w, https://www.cdl-group.co.uk/wp-content/uploads/2014/11/cta-2-150x100.jpg 150w
        ["bem.enabled"] = true
      }
    }
  }
}

return {}
