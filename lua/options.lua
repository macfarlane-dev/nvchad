require "nvchad.options"

-- add yours here!
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.autochdir = false
o.colorcolumn = "80"

-- WORKAROUND FOR ISSUES RUNNING GIT BASH FOR WINDOWS
-- only unix shells on windows will end in sh.exe
-- bash, zsh
if string.match(vim.opt.shell._value, "sh.exe") then
  vim.opt.shellcmdflag = "-c"
end
