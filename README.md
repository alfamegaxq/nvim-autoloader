# nvim-autoloader
Nvim plugin for autoloading tables from multiple files in a single directory

## Usage

In order to have a clean init.lua file for your nvim config you might have stumbled into problem,
where you have to include every plugin into your lazy setup
```
require("lazy").setup({
    require("plugins.plugin1"),
    require("plugins.plugin2"),
    require("plugins.plugin3")
})
```

nvim-autoloader will simplify this by loading all plugins configuration from plugins/ in a single line

```
require("lazy").setup(require("nvim-autoloader").autoloadPlugins())
```

## Setup

```
local autoloaderPath = vim.fn.stdpath "data" .. "/alfamegaxq/nvim-autoloader.nvim"
if not (vim.uv or vim.loop).fs_stat(autoloaderPath) then
  local autoloaderRepo = "https://github.com/alfamegaxq/nvim-autoloader.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=v0.1.0-alpha", autoloaderRepo, autoloaderPath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning alfamegaxq/nvim-autoloader:\n" .. out)
  end
end
vim.opt.rtp:prepend(autoloaderPath)
```

