# Starter config for NvChad

This project forks the popular [NvChad](https://nvchad.com/docs/quickstart/install/).

## Dependencies

* [NeoVim](https://github.com/neovim/neovim/releases/) >=0.9.5
* [Nerd Font](https://www.nerdfonts.com/) such as CaskaydiaCove Nerd Font (reserved name: Cascadia Code)
    * Make sure the font doesn't end with 'Mono' to prevent small icons.
    * Configure your terminal to use the Nerd Font
* [Git] >= 2.19.0
    * [Git Bash for Windows](https://gitforwindows.org/)
* [Make or Cmake] (C compiler used to build the plugin `telescope-fzf-native`)
    * Ubuntu: make from `sudo apt-get install build-essential`
    * Windows: [Cmake from Visual Studio 2022 with C++ Build Tools](https://visualstudio.microsoft.com/downloads/)
* [Ripgrep](https://github.com/BurntSushi/ripgrep)
* A terminal that supports true color and **undercurl** 
    * [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=en-au&gl=AU) (Windows)
    * [kitty](https://github.com/kovidgoyal/kitty) (Linux & Macos)
    * [wezterm](https://github.com/wez/wezterm) (Linux, Macos & Windows)
    * [alacritty](https://github.com/alacritty/alacritty) (Linux, Macos & Windows)
    * [iterm2](https://iterm2.com/) (Macos)
* Git clone this project
    * Windows: `git clone https://github.com/macfarlane-dev/nvchad.git ~/AppData/Local/nvim`
    * Linux/MacOS: `git clone https://github.com/macfarlane-dev/nvchad.git ~/.config/nvim`


## Installing Plugins

### Lazy plugin manager

Understanding the [Plugin Spec](https://github.com/folke/lazy.nvim) is essential to configuring plugins.

* After cloning, sync plugin versions to lazy-lock.json with `:Lazy sync`
* Use the `:Lazy` dashboard to install/update to latest versions/debug and more
* Add, remove and configure plugins from the `lua/plugins` directory

### Mason language manager

Mason manages tooling for code completion (LSP servers), debuggers (DAP servers), linters, and formatters
Read more at `:h mason`.

* Install the default tools with `:MasonInstallAll`
    * Defaults are defined at `lua/plugins/init.lua`
* Use the `:Mason` dashboard to search packages
* Install packages with `:MasonInstall <package_name>` 

### Treesitter text highlighting

Read more at `:h treesitter`.

* Install the defaults with `:TSInstall all` 
* Search supported languages [here](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
* Install packages with `:TSInstall <package_name>`


## Customisation

* Find your neovim configuration directory within neovim with `:h XDG_CONFIG_HOME`
* Configure keybindings in `lua/mappings.lua`
* Configure UI elements at `lua/chadrc.lua`
    * Options can be found [here](https://github.com/NvChad/NvChad/blob/6833c60694a626615911e379d201dd723511546d/lua/nvconfig.lua#L21)
* Vim options are configured in `lua/options.lua`
* Plugins are configured in the `lua/configs` directory


## Help 

* Read the cheat sheet: `<space>ch`
* Search the key mappings: `<space>fk`
* Read the custom key mappings at `lua/mappings.lua`
* Search the documentation: `<space>fh`
* Read your locally installed plugins. Find their location at `:h XDG_DATA_HOME`  


## Further Reading

* [Learn lua in 15 minutes](https://learnxinyminutes.com/docs/lua/)
* [NeoVim guide to Lua](https://neovim.io/doc/user/lua-guide.html)
* [Convert vimscript to Lua](https://neovim.io/doc/user/lua-guide.html#lua-guide)

