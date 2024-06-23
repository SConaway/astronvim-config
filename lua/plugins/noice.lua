return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          -- command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          -- inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },
}
