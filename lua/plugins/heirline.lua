return {
  "rebelot/heirline.nvim",
  dependencies = {
    { -- configure AstroUI to include a new UI icon
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Clock = "", -- add icon for clock

          -- add icons for Copilot status
          CopilotDisabled = " ",
          CopilotEnabled = " ",
          Copilot = "",
        },
      },
    },
    {
      "jonahgoldwastaken/copilot-status.nvim",
      dependencies = { "zbirenbaum/copilot.lua" },
      lazy = true,
      event = "BufReadPost",
    },
  },
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      -- status.component.mode(),
      status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),

      status.component.fill(),

      status.component.cmd_info(),

      status.component.fill(),

      -- copilot info via `vim.b.copilot_suggestion_auto_trigger`
      status.component.builder {
        {
          provider = function()
            local suggestion = vim.b.copilot_suggestion_auto_trigger
            local message = suggestion and "" or ""
            local icon = "Copilot"

            return status.utils.stylize(message, {
              icon = { kind = icon, padding = { right = 1 } },
              padding = { left = 1, right = 1 },
            })
          end,
        },
        hl = { fg = "black" },
        surround = { separator = "right", color = status.hl.mode_bg },
      },

      status.component.lsp(),
      status.component.virtual_env(),
      -- status.component.treesitter(),
      status.component.nav(),
      -- Create a custom component to display the time
      status.component.builder {
        {
          provider = function()
            local time = os.date "%H:%M" -- show hour and minute in 24 hour format
            ---@cast time string
            return status.utils.stylize(time, {
              icon = { kind = "Clock", padding = { right = 1 } }, -- use our new clock icon
              padding = { left = 1, right = 1 }, -- pad the right side so it's not cramped
            })
          end,
        },
        update = { -- update should happen when the mode has changed as well as when the time has changed
          "User", -- We can use the User autocmd event space to tell the component when to update
          "ModeChanged",
          callback = vim.schedule_wrap(function(_, args)
            if -- update on user UpdateTime event and mode change
              (args.event == "User" and args.match == "UpdateTime")
              or (args.event == "ModeChanged" and args.match:match ".*:.*")
            then
              vim.cmd.redrawstatus() -- redraw on update
            end
          end),
        },
        hl = { fg = "black" },
        surround = { separator = "right", color = status.hl.mode_bg },
      },
    }

    -- Now that we have the component, we need a timer to emit the User UpdateTime event
    vim.uv.new_timer():start( -- timer for updating the time
      (60 - tonumber(os.date "%S")) * 1000, -- offset timer based on current seconds past the minute
      60000, -- update every 60 seconds
      vim.schedule_wrap(function()
        vim.api.nvim_exec_autocmds( -- emit our new User event
          "User",
          { pattern = "UpdateTime", modeline = false }
        )
      end)
    )
  end,
}
