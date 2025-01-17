---@type LazySpec
return {
  "numToStr/Comment.nvim",
  init = function()
    local ft = require "Comment.ft"

    ---@diagnostic disable-next-line: param-type-mismatch
    ft.set("systemverilog", ft.get "c")
    ---@diagnostic disable-next-line: param-type-mismatch
    ft.set("verilog", ft.get "c")
    ---@diagnostic disable-next-line: param-type-mismatch
    ft.set("openscad", ft.get "c")
  end,
}
