-- LSP Config
vim.cmd('packadd nvim-lspconfig')
local util = require("lspconfig/util")
local on_attach = function(client, bufnr)
  local function set_key(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  set_key('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  set_key('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  set_key('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  set_key('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  set_key('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  set_key('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  set_key('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  set_key('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  set_key('n', '<localleader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  set_key('n', '<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  set_key('n', '<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  set_key('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  set_key('n', '<localleader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  set_key('n', '<localleader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  set_key('n', '<localleader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  set_key('n', '<localleader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    set_key("n", "<localleader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    set_key("n", "<localleader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

require'lspconfig'.elixirls.setup{ 
  on_attach = on_attach,
  cmd = { "elixir-ls" }
}
require'lspconfig'.pyls.setup{ on_attach = on_attach }
require'lspconfig'.terraformls.setup{ on_attach = on_attach}
require'lspconfig'.tsserver.setup{ on_attach = on_attach}


-- Compe 
