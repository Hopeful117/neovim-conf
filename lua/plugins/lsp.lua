return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "basedpyright",
                "ruff"
            },
            automatic_enable = true,
        },
    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set(
                        "n",
                        "gd",
                        vim.lsp.buf.definition,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>rn",
                        vim.lsp.buf.rename,
                        opts
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        opts
                    )
                end,
            })
        end,
    },
}
