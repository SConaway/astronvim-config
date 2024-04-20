-- Customize neo-tree

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- print(vim.inspect(opts))

    -- rename tabs
    opts.source_selector.sources[1].display_name = " Files"
    opts.source_selector.sources[2].display_name = "󰈙 Open"

    opts.filesystem.filtered_items = {
      hide_dotfiles = false,
      never_show = { ".DS_Store" },
    }

    opts.filesystem.follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    }
  end,
}
