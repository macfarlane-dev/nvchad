require "nvchad.options"

-- add yours here!
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.autochdir = true
o.colorcolumn = "80"

if vim.opt.shell._value == "/bin/bash" then
  vim.opt.shell = "/bin/bash --login"
end

-- WORKAROUND FOR ISSUES RUNNING GIT BASH FOR WINDOWS
-- only unix shells on windows will end in sh.exe
-- bash, zsh
if string.match(vim.opt.shell._value, "sh.exe") then
  vim.opt.shellcmdflag = "-c"
  vim.opt.shellxquote = "("
  vim.opt.shellslash = true
end

