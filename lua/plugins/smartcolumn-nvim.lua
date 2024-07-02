return {
  "m4xshen/smartcolumn.nvim",
  event = { "InsertEnter", "User AstroFile" },
  opts = {
    disabled_filetypes = { "alpha", "neo-tree", "starter", "help", "text", "markdown", "html" },
    scope = "line",
    colorcolumn = "90",
  },
}
