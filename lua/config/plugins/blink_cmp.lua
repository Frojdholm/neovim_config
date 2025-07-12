return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        -- use a release tag to download pre-built binaries
        version = '1.4.1',
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = 'super-tab' },

            appearance = {
                -- use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                -- nerd_font_variant = 'mono'
            },

            cmdline = {
                keymap = { preset = 'inherit' },
                completion = { menu = { auto_show = true } },
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            completion = {
                list = {
                    selection = {
                        preselect = function(ctx)
                            return not require('blink.cmp').snippet_active({ direction = 1 })
                        end,
                    }
                }
            }
        },
        opts_extend = { "sources.default" }
    }
}
