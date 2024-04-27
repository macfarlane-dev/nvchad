# Starter config for NvChad

This project forks the popular [NvChad](https://nvchad.com/docs/quickstart/install/).

## Dependencies

* [NeoVim](https://github.com/neovim/neovim/releases/) >=0.9.5
* [Nerd Font](https://www.nerdfonts.com/)
    * Make sure the nerd font you set doesn't end with Mono to prevent small icons.
* [Ripgrep](https://github.com/BurntSushi/ripgrep)

### Windows Only

* [Git Bash for Windows](https://gitforwindows.org/)
* [Visual Studio 2022 with C++ Build Tools](https://visualstudio.microsoft.com/downloads/)

## Customisation

* Find your neovim configuration directory within neovim with `:h XDG_CONFIG_HOME`
* Configure keybindings in `lua/mappings.lua`
* Configure UI elements at `lua/chadrc.lua`
    * Options can be found [here](https://github.com/NvChad/NvChad/blob/6833c60694a626615911e379d201dd723511546d/lua/nvconfig.lua#L21)
* Vim options are configured in `lua/options.lua`
* Plugins are configured in the `lua/configs` directory

## Further Reading

* [Learn lua in 15 minutes](https://learnxinyminutes.com/docs/lua/)
* [NeoVim guide to Lua](https://neovim.io/doc/user/lua-guide.html)
* [Convert vimscript to Lua](https://neovim.io/doc/user/lua-guide.html#lua-guide)

