return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },

    config = function(_, opts)
        require("conform").setup(opts)

        vim.keymap.set(
            { "n", "v" },
            "<leader>f",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end,
            { desc = "Format file" }
        )
    end,
}
