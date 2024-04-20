-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  -- -@type AstroCoreOpts
  opts = {
    -- vim options can be configured here

    features = {
      highlighturl = true,
    },
    options = {
      opt = {
        -- relativenumber = true, -- sets vim.opt.relativenumber
        -- number = true,         -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true,  -- sets vim.opt.wrap
        breakindent = true,
        breakindentopt = "shift:3",
        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,

        list = true,
        listchars = "trail:·,tab:> ",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- mode:
      n = {
        -- normal mode

        -- navigate buffer tabs with `H` and `L` and S-Up, S-Down
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<S-Up>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Down>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Peek (markdown preview)
        -- this sends a nice little warning when invalid filetype
        ["<localleader>p"] = { ":PeekOpen<cr>", desc = "Open Peek Preview" },

        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- leader then c: open config
        ["<Leader>c"] = {
          ":Neotree action=show source=filesystem position=current dir=~/.config/astronvim<cr>",
          desc = "Edit Config",
        },

        -- edit search keymaps
        ["<Leader>fb"] = { "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },

        -- splits
        ["<Leader>,"] = { "<cmd>split<cr>", desc = "HSplit" },
        ["<Leader>."] = { "<cmd>vsplit<cr>", desc = "VSplit" },

        -- set a to A (default to append)
        a = "A",
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}

-- vim: nospell
