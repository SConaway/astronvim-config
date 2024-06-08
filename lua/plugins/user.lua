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

      -- Icon Names in ~/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/_astroui.lua
      local get_icon = require("astroui").get_icon
      opts.section.buttons.val = {
        opts.button("n", get_icon("FileNew", 2, true) .. "New File", ":e new<cr>"),

        opts.button(
          "f",
          get_icon("Search", 2, true) .. "Find File",
          ":lua require('telescope.builtin').find_files()<cr>"
        ),
        opts.button(
          "w",
          get_icon("WordFile", 2, true) .. "Find Word",
          ":lua require('telescope.builtin').live_grep()<cr>"
        ),
        opts.button(
          "h",
          get_icon("Sort", 2, true) .. "Find history",
          ":lua require('telescope.builtin').command_history()<cr>"
        ),
        opts.button(
          "H",
          get_icon("Search", 2, true) .. "Find help",
          ":lua require('telescope.builtin').help_tags()<cr>"
        ),

        opts.button(
          "c",
          "  Edit Configuration",
          ":cd ~/.config/nvim/<cr> :Neotree action=show source=filesystem <cr>"
          -- ":Neotree action=show source=filesystem position=current dir=~/.config/nvim<cr>"
        ),
        -- opts.button("c", "  Edit Configuration", ":e $HOME/.config/astronvim/<cr>"),
        -- opts.button("c", "  Edit Configuration", ":lua vim.notify('ToDo', vim.log.levels.WARN)<cr>"),

        opts.button("q", get_icon("BufferClose", 2, true) .. "Quit", ":quit<cr>"),
      }
      return opts
    end,
  },
}
