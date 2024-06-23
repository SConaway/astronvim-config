-- based on: https://github.com/AstroNvim/astrocommunity/blob/9ad5b67d06ef41e1ec58eb89d66704e0eb436228/lua/astrocommunity/editing-support/multiple-cursors-nvim/init.lua

return {
  "brenton-leighton/multiple-cursors.nvim",
  cmd = {
    "MultipleCursorsAddDown",
    "MultipleCursorsAddUp",
    "MultipleCursorsMouseAddDelete",
    "MultipleCursorsAddMatches",
    "MultipleCursorsAddMatchesV",
    "MultipleCursorsAddJumpNextMatch",
    "MultipleCursorsJumpNextMatch",
    "MultipleCursorsLock",
  },
  dependencies = {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      for lhs, map in pairs {
        ["<C-S-Down>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
        ["<C-S-Up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
        ["<C-S-LeftMouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", desc = "Add cursor with mouse" },
        ["<C-LeftMouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", desc = "Add cursor with mouse" },
      } do
        maps.n[lhs] = map
        maps.i[lhs] = map
      end
    end,
  },
  opts = {},
}
