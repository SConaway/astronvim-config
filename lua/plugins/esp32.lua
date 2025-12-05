return {
  -- {
  --   "Aietes/esp32.nvim",
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     if vim.fn.executable "idf.py" == 1 then
  --       vim.notify("Enabling ESP32 clangd config.", vim.log.levels.INFO)
  --       local esp32 = require "esp32"
  --       opts.servers = opts.servers or {}
  --       opts.servers.clangd = esp32.lsp_config()
  --     end
  --     return opts
  --   end,
  -- },
}
