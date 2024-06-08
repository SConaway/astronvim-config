return {
  "zbirenbaum/copilot.lua",
  opts = {
    -- force the panel to auto refresh when it's open
    panel = {
      auto_refresh = true,
    },
    -- try to speed up the suggestions (seems to work)
    suggestion = {
      debounce = 25,
    },
  },
}
