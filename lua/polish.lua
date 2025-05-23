-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- .v is always verilog
vim.cmd [[
  au BufNewFile,BufRead *.v set filetype=verilog
  au BufNewFile,BufRead *.njk set filetype=html
]]

-- tame auto comment (don't comment out the next line if the current line is a comment)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "set formatoptions-=cro",
})

-- for go, disable tab listchar
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "set listchars=trail:·,tab:\\ \\ ",
})
