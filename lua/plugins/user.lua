-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the opts header
      -- remove ugly thing
      opts.section.header.val = {}

      -- Icon Names in ~/.local/share/astronvim/lazy/AstroNvim/lua/astronvim/plugins/_astroui.lua
      local get_icon = require("astroui").get_icon
      opts.section.buttons.val = {
        opts.button("n", get_icon("FileNew", 2, true) .. "New File", ":e new<cr>"),
        opts.button("f", get_icon("Search", 2, true) .. "Find File  "),
        -- opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        -- opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        -- opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
        -- opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
        -- opts.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
        -- Neotree action=show source=filesystem position=current dir=~/.config/astronvim
        opts.button(
          "c",
          "  Edit Configuration",
          ":Neotree action=show source=filesystem position=current dir=~/.config/nvim<cr>"
        ),
        -- opts.button("c", "  Edit Configuration", ":e $HOME/.config/astronvim/<cr>"),
        -- opts.button("c", "  Edit Configuration", ":lua vim.notify('ToDo', vim.log.levels.WARN)<cr>"),

        opts.button("q", get_icon("BufferClose", 2, true) .. "Quit", ":quit<cr>"),
      }
      return opts
    end,
  },
}
