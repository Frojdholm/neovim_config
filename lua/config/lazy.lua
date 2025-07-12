local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato"
            }

            vim.opt.termguicolors = true
            vim.cmd.colorscheme "catppuccin"
        end
    },
    { 
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    { 
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {}
        end,
    },
    { "numToStr/Comment.nvim", },
    -- { "nvim-telescope/telescope.nvim",
    --     tag = "0.1.8",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = function()
    --         local builtin = require("telescope.builtin")
    --         vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    --         vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
    --         vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    --         vim.keymap.set("n", "<leader>ps", builtin.lsp_workspace_symbols, {})
    --     end
    -- },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" },
        opts = {}
    },
    { "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "rust", "python", "c", "lua", "vim", "vimdoc", "query" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    -- additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    { import = "config.plugins" }, -- Import all plugins defined in lua/config/plugins
}
