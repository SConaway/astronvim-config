return {
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },
    lazy = true,
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_toc_config = {
        show_help = 0,
        split_pos = ":vert :botright", -- 'rightbelow'
        split_width = 30,
      }
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-shell-escape",
        },
      }
    end,
  },
}
