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

-- from: https://github.com/AstroNvim/astrocommunity/blob/b23f90a2598fe83341d421f82803edb3602183c5/lua/astrocommunity/completion/copilot-lua-cmp/init.lua
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end
local function copilot_action(action)
  local copilot = require "copilot.suggestion"
  return function()
    if copilot.is_visible() then
      copilot[action]()
      return true -- doesn't run the next command
    end
  end
end

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
    -- force-enable these two
    filetypes = {
      markdown = true,
      gitcommit = true,
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = function(_, opts)
        if not opts.keymap then opts.keymap = {} end

        opts.keymap["<Tab>"] = {
          copilot_action "accept",
          "select_next",
          "snippet_forward",
          function(cmp)
            if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
          end,
          "fallback",
        }
        opts.keymap["<C-X>"] = { copilot_action "next" }
        opts.keymap["<C-Z>"] = { copilot_action "prev" }
        opts.keymap["<C-Right>"] = { copilot_action "accept_word" }
        opts.keymap["<C-L>"] = { copilot_action "accept_word" }
        opts.keymap["<C-Down>"] = { copilot_action "accept_line" }
        opts.keymap["<C-J>"] = { copilot_action "accept_line", "select_next", "fallback" }
        opts.keymap["<C-C>"] = { copilot_action "dismiss" }
      end,
    },
  },
  keys = {
    -- toggle copilot
    -- this works by turning on and off the auto trigger
    -- which is when it starts suggesting things when you are in insert mode

    -- via alt c in normal and insert modes
    {
      "<M-c>",
      toggle,
      desc = "toggle copilot",
      mode = "n",
    },
    {
      "<M-c>",
      toggle,
      desc = "toggle copilot",
      mode = "i",
    },

    -- via <localleader>c in normal mode
    {
      "<localleader>c",
      toggle,
      desc = "toggle copilot",
      mode = "n",
    },
  },
}
