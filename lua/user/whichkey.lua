local M = {
    "folke/which-key.nvim",
    dependencies = {"afreakk/unimpaired-which-key.nvim"}
}

function M.config()
    local mappings = {
        q = {
            name = "Session",
            q = {"<cmd>qa<CR>", "Quit"}
        },
        h = {"<cmd>nohlsearch<CR>", "NOHL"},
        [";"] = {
            h = {"<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal terminal"},
            v = {"<cmd>ToggleTerm direction=vertical<CR>", "Vertical terminal"},
            f = {"<cmd>ToggleTerm direction=float<CR>", "Floating terminal"},
            [";"] = {"<cmd>ToggleTerm direction=tab<CR>", "Terminal tab"}
        },
        v = {"<cmd>vsplit<CR>", "Split"},
        b = {
            name = "Buffer",
            d = {"<cmd>bd<CR>", "Delete buffer"}
        },
        d = {
            name = "Debug"
        },
        f = {
            name = "Find"
        },
        g = {
            name = "Git"
        },
        c = {
            name = "Code"
        },
        t = {
            name = "Test"
        },
        a = {
            name = "Tab",
            n = {"<cmd>$tabnew<cr>", "New Empty Tab"},
            N = {"<cmd>tabnew %<cr>", "New Tab"},
            o = {"<cmd>tabonly<cr>", "Only"},
            h = {"<cmd>-tabmove<cr>", "Move Left"},
            l = {"<cmd>+tabmove<cr>", "Move Right"}
        },
        T = {
            name = "Treesitter"
        },
        w = {
            name = "Window",
            w = {"<C-W>p", "Other Window"},
            d = {"<C-W>c", "Delete Window"},
            ["-"] = {"<C-W>s", "Split Window Below"},
            ["|"] = {"<C-W>v", "Split Window Right"},
            ["\\"] = {"<cmd>vnew | wincmd p<CR>", "Empty split"}
        }
    }

    local which_key = require "which-key"
    which_key.setup {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true
            }
        },
        window = {
            border = "rounded",
            position = "bottom",
            padding = {2, 2, 2, 2}
        },
        ignore_missing = true,
        show_help = false,
        show_keys = false,
        disable = {
            buftypes = {},
            filetypes = {"TelescopePrompt"}
        },
        triggers = "auto"
    }

    local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>"
    }

    which_key.register(mappings, opts)

    local uwk = require("unimpaired-which-key")
    which_key.register(uwk.normal_mode)
    which_key.register(uwk.normal_and_visual_mode, { mode = { "n", "v" } })

end

return M
