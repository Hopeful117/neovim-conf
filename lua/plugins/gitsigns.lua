return {
    "lewis6991/gitsigns.nvim",

    opts = {
        current_line_blame = false,
    },

    config = function(_, opts)
        require("gitsigns").setup(opts)

        local gs = require("gitsigns")

        vim.keymap.set(
            "n",
            "]c",
            function()
                gs.nav_hunk("next")
            end,
            { desc = "Next Git change" }
        )

        vim.keymap.set(
            "n",
            "[c",
            function()
                gs.nav_hunk("prev")
            end,
            { desc = "Previous Git change" }
        )

        vim.keymap.set(
            "n",
            "<leader>hp",
            gs.preview_hunk,
            { desc = "Preview Git hunk" }
        )
    end,
}
