local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require('catppuccin').setup({
    transparent_background = true,
  })

  vim.cmd.colorscheme "catppuccin-frappe"
end

return M
