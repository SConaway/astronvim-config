-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.pack.go" },

  -- import/override with your plugins folder
  -- { import = "astrocommunity.recipes.heirline-clock-statusline" },

  { import = "astrocommunity.editing-support.auto-save-nvim" },

  { import = "astrocommunity.motion.mini-surround" },

  { import = "astrocommunity.media.vim-wakatime" },

  { import = "astrocommunity.recipes.ai" },
}
