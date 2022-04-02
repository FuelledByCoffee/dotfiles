
local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  vim.keymap.set("n", "K",  vim.lsp.buf.hover,            { buffer=0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition,       { buffer=0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,  { buffer=0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation,   { buffer=0 })
  vim.keymap.set("n", "-r", vim.lsp.buf.rename,           { buffer=0 })
  vim.keymap.set("n", "-.", vim.lsp.buf.code_action,      { buffer=0 })
  vim.keymap.set("n", "-n", vim.diagnostic.goto_next,     { buffer=0 })
  vim.keymap.set("n", "-p", vim.diagnostic.goto_prev,     { buffer=0 })
  vim.keymap.set("n", "-l", "<cmd>Telescope diagnostics<cr>", { buffer=0 })


  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  -- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  --    See `:help formatexpr` for more information.
  -- vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
end

-- connect to server
require('lspconfig').clangd.setup{
  on_attach = function() print("Attached")
    vim.keymap.set("n", "K",  vim.lsp.buf.hover,            { buffer=0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,       { buffer=0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,  { buffer=0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,   { buffer=0 })
    vim.keymap.set("n", "-r", vim.lsp.buf.rename,           { buffer=0 })
    vim.keymap.set("n", "-.", vim.lsp.buf.code_action,      { buffer=0 })
    vim.keymap.set("n", "-n", vim.diagnostic.goto_next,     { buffer=0 })
    vim.keymap.set("n", "-p", vim.diagnostic.goto_prev,     { buffer=0 })
    vim.keymap.set("n", "-l", "<cmd>Telescope diagnostics<cr>", { buffer=0 })
  end,
}


-- An example of configuring for `sumneko_lua`,
--  a language server for Lua.

-- set the path to the sumneko installation
-- local system_name = "Linux" -- (Linux, macOS, or Windows)
-- local sumneko_root_path = '/path/to/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- require('lspconfig').sumneko_lua.setup({
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   -- An example of settings for an LSP server.
--   --    For more options, see nvim-lspconfig
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     }
--   },

--   on_attach = custom_lsp_attach
-- })
