-- from: ~/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/notify.lua
return {
  "rcarriga/nvim-notify",
  opts = function(_, opts)
    -- change timeout because I'm impatient
    opts.timeout = 1000
    -- max width
    opts.max_width = function() return math.floor(vim.o.columns * 0.45) end
    -- make it small
    opts.render = "wrapped-compact"
  end,
}
