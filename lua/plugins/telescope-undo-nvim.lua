-- select with <c-cr> or <cr>

---@type LazySpec
return {
  "debugloop/telescope-undo.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "debugloop/telescope-undo.nvim",
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
              },
            },
          },
        },
      },
      opts = function()
        require("telescope").setup {
          extensions = {
            undo = {
              mappings = {
                i = {
                  ["<cr>"] = function(bufnr) return require("telescope-undo.actions").restore(bufnr) end,
                },
              },
            },
          },
        }
        require("telescope").load_extension "undo"
      end,
    },
  },
}
