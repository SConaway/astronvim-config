---@type LazySpec
return {
  "AstroNvim/astrolsp",
  -- we must use the function override because table merging
  -- does not play nicely with list-like tables
  ---@param opts AstroLSPOpts
  opts = function(_plugin, opts)
    -- unblock servers
    opts.servers = vim.list_extend(opts.servers or {}, {
      "clangd",
      "ltex",
    })

    -- formatting options
    opts.formatting.filter = function(client)
      print(client.name)
      -- disable formatting for lua_ls
      -- if client.name == "lua_ls" then return false end

      -- only enable null-ls for javascript files
      -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end

      -- if the path includes 20289 skip it
      -- if string.find(vim.fn.expand "%:p", "20289", 1, true) then return false end

      -- enable all other clients
      return true
    end

    -- return the modified opts
    return opts
  end,
}
