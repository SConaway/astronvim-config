-- define function for toggling
local function toggle()
  -- get the current value of the auto trigger
  local auto_trigger = vim.b.copilot_suggestion_auto_trigger
  -- set the auto trigger to the opposite of what it is
  vim.b.copilot_suggestion_auto_trigger = not auto_trigger
  -- require("copilot.suggestion").toggle_auto_trigger()
  -- works too, but since i'm using the status below, decided to manually toggle it

  -- if the auto trigger is now on
  if vim.b.copilot_suggestion_auto_trigger then
    -- show a message
    vim.notify "Copilot is on"
  else
    -- otherwise show a message
    vim.notify "Copilot is off"
  end
end

---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      -- force the panel to auto refresh when it's open
      panel = {
        auto_refresh = true,
      },
      -- try to speed up the suggestions (seems to work)
      suggestion = {
        debounce = 25,
        auto_trigger = false,
      },
      -- force-enable markdown
      filetypes = {
        markdown = true,
        gitcommit = true,
      },
    },
    keys = {
      -- toggle copilot
      -- this works by turning on and off the auto trigger
      -- which is when it starts suggesting things when you are in insert mode

      -- via ,c
      {
        "<localleader>c",
        toggle,
        desc = "toggle copilot",
        mode = "n",
      },
      -- via alt c
      {
        "<M-c>",
        toggle,
        desc = "toggle copilot",
        mode = "i",
      },
    },
  },
}
