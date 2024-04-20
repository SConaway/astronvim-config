-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
      },
    },
    formatting = {
      filter = function(client)
        -- disable formatting for lua_ls
        -- if client.name == "lua_ls" then return false end

        -- only enable null-ls for javascript files
        -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end

        -- if the path includes 20289 skip it
        if string.find(vim.fn.expand "%:p", "20289", 1, true) then return false end

        -- enable all other clients
        return true
      end,
    },
  },
}
