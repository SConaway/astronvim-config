-- Customize None-ls sources

---@type LazySpec
return {
  dir = "/Users/steven/tmp/mdslw/none-ls.nvim",
  -- "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,

      -- add extra args to mdslw
      null_ls.builtins.formatting.mdslw.with {
        extra_args = {
          "-w 0",
        },
      },
    }
    return config -- return final config table
  end,
}
