-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        breakindent = true,
        breakindentopt = "shift:4",

        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 0, -- change to 0 to use sts instead

        list = true,
        listchars = "trail:·,tab:» ",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- leader then c: open config
        ["<Leader>c"] = {
          ":cd ~/.config/nvim/<cr> :Neotree action=show source=filesystem <cr>",
          desc = "Edit Config",
        },

        -- [ and ] for h/v split
        ["["] = { "<C-w>s", desc = "Split horizontal" },
        ["]"] = { "<C-w>v", desc = "Split vertical" },

        -- set a to A (default to append)
        a = "A",

        -- quit shortcut
        ["<Leader>qa"] = { "<cmd>qa<cr>", desc = "Quit All" },

        -- terminal shortcuts
        ["<Leader>T"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },
        ["<Leader>tt"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },

        -- :Lazy shortcut
        ["<Leader>pl"] = { "<Cmd>Lazy<CR>", desc = "Lazy" },

        -- VSCode-like duplicate with alt-shift up/down
        -- TODO: mini.move this?
        ["<A-S-Up>"] = { '"dyy "dp k', desc = "Duplicate line up" },
        ["<A-S-Down>"] = { '"dyy "dp', desc = "Duplicate line down" },
      },
    },
  },
}

-- vim: nospell
