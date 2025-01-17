-- local MiniMove = require "mini.move"

--# selene: allow(undefined_variable) -- for MiniMove
---@type LazySpec
return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  opts = {
    pre_hook = function()
      require("nvim-autopairs").disable()
      require("cmp").setup { enabled = false }
    end,
    post_hook = function()
      require("nvim-autopairs").enable()
      require("cmp").setup { enabled = true }
    end,
    custom_key_maps = {
      { "n", { "<A-k>", "<A-Up>" }, function() MiniMove.move_line "up" end },
      { "n", { "<A-j>", "<A-Down>" }, function() MiniMove.move_line "down" end },
      { "n", { "<A-h>", "<A-Left>" }, function() MiniMove.move_line "left" end },
      { "n", { "<A-l>", "<A-Right>" }, function() MiniMove.move_line "right" end },

      { "x", { "<A-k>", "<A-Up>" }, function() MiniMove.move_selection "up" end },
      { "x", { "<A-j>", "<A-Down>" }, function() MiniMove.move_selection "down" end },
      { "x", { "<A-h>", "<A-Left>" }, function() MiniMove.move_selection "left" end },
      { "x", { "<A-l>", "<A-Right>" }, function() MiniMove.move_selection "right" end },
    },
  }, -- This causes the plugin setup function to be called
  keys = {
    -- { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
    -- { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

    -- { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
    -- { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

    { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },
    { "<M-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

    {
      "<Leader>a",
      "<Cmd>MultipleCursorsAddMatches<CR>",
      mode = { "n", "x" },
      desc = "Add cursors to all instances of cword",
    },
    -- {
    --   "<Leader>A",
    --   "<Cmd>MultipleCursorsAddMatchesV<CR>",
    --   mode = { "n", "x" },
    --   desc = "Add cursors to cword in previous area",
    -- },

    {
      "<Leader>d",
      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      mode = { "n", "x" },
      desc = "Add cursor here and jump to next cword",
    },
    { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

    { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
  },
}
