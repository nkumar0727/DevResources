# [neovim](https://github.com/neovim/neovim) setup

## Installation ([official github docs](https://github.com/neovim/neovim/wiki/Installing-Neovim))

### Windows

#### [winget](https://winstall.app/apps/Neovim.Neovim)

```
> winget install Neovim.Neovim
```

Note that here we're not using [a GUI frontend](https://github.com/neovim/neovim/wiki/Related-projects#gui); we're entering the command `nvim` in the terminal.

### Debian Linux

TODO

## Extra Configuration

### Windows

Make sure your environment variables are pointing to the Neovim EXE path.

```
C:\Program Files\Neovim\bin
```

## Debian Linux

TODO

## IDE-like Configuration

Create a [directory (if not already) for configuration](https://neovim.io/doc/user/lua-guide.html#lua-guide-config) called `nvim`. Example:
- On Windows this should be `~/AppData/Local/nvim`
- On Debian Linux, this should be: `~/.config/nvim`

We will use a full Lua configuration (`init.lua`) and NO vimscript.
Please look at the configuration in this repository for source-of-truth. Anything that cannot be determined there will have notes/references here.

### Plugins

#### Plugin Manager

##### [lazy](https://github.com/folke/lazy.nvim)

Follow the instructions on the repository.

#### File Explorer

##### [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

Gives a tree-like structure for file navigation.
Include a dependency on [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) so that filetype icons show.
Donwload your preferred [NerdFont](https://www.nerdfonts.com/) ZIP file, extract all the contents to a directory. Ex, [Hack Nerd Font](https://www.programmingfonts.org/#hack).

Windows: 
- By dragging and dropping all the TTF font files from directory to `C:\Windows\Fonts`, they will [auto-install](https://support.microsoft.com/en-us/office/add-a-font-b7c5f17c-4426-4b53-967f-455339c564c1).
- If you're using Windows Terminal, you can click ['Settings' and enable the font](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup) for the profile.
- The next time you start `nvim`, it should be using filetype icons.

#### Keybindings

##### [which-key](https://github.com/folke/which-key.nvim)

TODO

#### Searching

##### [telescope](https://github.com/nvim-telescope/telescope.nvim)

#### Appearence

##### [lualine](https://github.com/nvim-lualine/lualine.nvim)

TODO

##### [tokyonight](https://github.com/folke/tokyonight.nvim)

TODO

#### Syntax Highlighting, Autocomplete, and LSPs

##### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

TODO. This one requires some Windows-specific setup. I had to troubleshoot the C compiler being used; include this.

#### Version Control

TODO. Include fugitive after I see how it works.

### Useful Keybindings
