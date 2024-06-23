---@type LazySpec
return {
  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-Down>",
        up = "<A-Up>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-Down>",
        line_up = "<A-Up>",
      },
    },
    lazy = true,
    event = "BufEnter",
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
