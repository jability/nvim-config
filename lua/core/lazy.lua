--- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

--- Load lazy.nvim
require("lazy").setup("core.plugins", {
  install = {
    missing = false,
  },
  change_detection = {
    enabled = false,
    notify = true,
  },
  debug = true,
})
