-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- languages
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.pack.go" },

  -- nvim itself
  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },

  -- editing
  { import = "astrocommunity.editing-support.text-case-nvim" },
  -- { import = "astrocommunity.lsp.lsp-signature-nvim" }, -- conflicts with noice?
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.color.nvim-highlight-colors" },

  -- Appearance
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  -- misc
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.motion.mini-surround" },

  { import = "astrocommunity.markdown-and-latex.vimtex" }, -- modified to be lazier and to work as I like

  -- .md rendering
  -- { import = "astrocommunity.markdown-and-latex.glow-nvim" }, -- wasn't sure how to set up keys so I gave up
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },

  -- import/override with your plugins folder
}
