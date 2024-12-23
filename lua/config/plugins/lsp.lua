return {
    { 
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                capabilities
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}
                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    vim.keymap.set('n', 'gre', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
                    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client.supports_method("textDocument/formatting", 0) then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({async = false, id = args.data.client_id})
                            end,
                        })
                    end
                end
            })

            require('lspconfig').rust_analyzer.setup {}
            require('lspconfig').zls.setup {}
            require('lspconfig').ruff.setup {}
            require('lspconfig').pylsp.setup {}
        end
    },
}
