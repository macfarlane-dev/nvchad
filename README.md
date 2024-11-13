# Starter config for NvChad

This project forks the popular [NvChad](https://nvchad.com/docs/quickstart/install/).

## Dependencies

* [NeoVim](https://github.com/neovim/neovim/releases/) >=0.10.0
	* Get the latest version and `sha256sum` checksum from [the releases page](https://github.com/neovim/neovim/releases)
	```bash
	cd /tmp
	version=0.10.1
	curl -LO https://github.com/neovim/neovim/releases/download/v${version}/nvim-linux64.tar.gz 
	# Use the checksum from the releases page to validate the downloaded file. 
	echo '4867de01a17f6083f902f8aa5215b40b0ed3a36e83cc0293de3f11708f1f9793  nvim-linux64.tar.gz' \
		| sha256sum -c -
	tar xzf nvim-linux64.tar.gz
	sudo mkdir -p /opt/nvim
	sudo mv nvim-linux64 /opt/nvim/${version}
	sudo ln -s /opt/nvim/${version}/bin/nvim /usr/local/bin/nvim
	rm /tmp/nvim-linux64.tar.gz
	```
* [Nerd Font](https://www.nerdfonts.com/) such as CaskaydiaCove Nerd Font (reserved name: Cascadia Code)
    * Make sure the font doesn't end with 'Mono' to prevent small icons.
    * Configure your terminal to use the Nerd Font
* Git >= 2.19.0
    * [Git Bash for Windows](https://gitforwindows.org/)
* Make or Cmake (a C build tool) and `gcc` or `zig` (a C compiler used to build the plugin `telescope-fzf-native`)
    * Ubuntu: make from `sudo apt-get install build-essential`
    * Windows: `Cmake` from Visual Studio 2022 with C++ Build Tools
		* Download [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019) at All Downloads > Tools for Visual Studio > Build Tools for Visual Studio 2022
		* Run the Build Tools manager and install `Desktop Development C++ build tools`
		* Run `nvim` for the first time
		* Navigate to `/AppData/Local/nvim-data/lazy/telescope-fzf-native`
		* Run build command ([sourced from official docs](https://github.com/nvim-telescope/telescope-fzf-native.nvim))
		```x86 Native Tools Command Prompt for VS 2022
		cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
		```
	* Windows: `zig` with `winget install zig.zig` (may take 10-20 minutes to install)
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
* *(optional)* [Install NodeJS](https://github.com/nvm-sh/nvm), required to install some LSPs including Pyright


## Installing Plugins

### Lazy plugin manager

Understanding the [Plugin Spec](https://github.com/folke/lazy.nvim) is essential to configuring plugins.

* After cloning, restore plugin versions to lazy-lock.json with `:Lazy restore`
* Use the `:Lazy` dashboard to install/update to latest versions/debug and more
* Add, remove and configure plugins from the `lua/plugins` directory

### Mason language manager

Mason manages tooling for code completion (LSP servers), debuggers (DAP servers), linters, and formatters
Read more at `:h mason`.

* Install the default tools with `:MasonInstallAll`
    * Defaults are defined at `lua/plugins/init.lua`
* Use the `:Mason` dashboard to search packages
* Install packages with `:MasonInstall <package_name>` 

#### Pyright LSP configuration

The Python LSP `Pyright` requires a `pyrightconfig.json` [configuration file](https://microsoft.github.io/pyright/#/configuration) at a project root to [resolve imports](https://microsoft.github.io/pyright/#/import-resolution?id=configuring-your-python-environment).

```json
{
  "venv": "myvenv"
}
```


### Treesitter text highlighting

Read more at `:h treesitter`.

* On startup Treesitter installs packages listed in `lua/plugins/init.lua`, `opts.ensure_installed`  
* Search supported languages [here](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
* Install additional packages with `:TSInstall <package_name>`

### Building telescope-fzf-native

`telescope-fzf-native` must be compiled locally. This project is configured to build automatically on Linux with `make`. If this fails the first time it can be re-built from the `:Lazy` menu by navigating to `telescope-fzf-native` and hitting `gb`.


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
* [Extending lazy plugin configurations with AstroVim](https://docs.astronvim.com/configuration/customizing_plugins/). While this project does not use Astrovim, this is the best documentation of overriding lazy.vim plugin configurations.

