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

With any plugin, you can check its install status/health using `:checkhealth` for all or `:checkhealth <plugin>` in `nvim` NORMAL mode.

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

Gives information on which key bindings are possible in a given buffer. Very useful when you're not sure which keys you have configured, or you want to change something.

#### Searching

##### [telescope](https://github.com/nvim-telescope/telescope.nvim)

Nice file searching capabilities.

#### Appearence

##### [lualine](https://github.com/nvim-lualine/lualine.nvim)

Gives file metadata and nvim status at the bottom.

##### [tokyonight](https://github.com/folke/tokyonight.nvim)

Nice theme, easy on the eyes.

#### Syntax Highlighting, Autocomplete, and LSPs

##### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

This provides filetype-specific syntax highlighting using a language parser.
Some [Windows-specific instructions](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support):
- Parser Installation
  - Enable [Developer Mode](https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development). This is for creating symlinks.
  - Don't prefer installs using `git`; use `curl` instead:
  - ```
    require 'nvim-treesitter.install'.prefer_git = false
    ```
- C Compiler
  - ```
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    ```
  - Make sure your `PATH` variables are pointed to the correct compiler.
    - I had it such that the `gcc` compiler that was used was a 32-bit compiler (I had `C:\MinGW\bin` which had only a 32-bit compiler). The error message I got is [described in this Github Issue](https://github.com/nvim-treesitter/nvim-treesitter/issues/1985):
    - ```
      E5108: Error executing lua Failed to load parser: uv_dlopen: C:\Users\Swagat\AppData\Local\nvim\plugged\nvim-treesitter\parser\cpp.so is not a valid Win32 application."
      ```
    - I was using [`msys2`](https://www.msys2.org/) for any software building toolchains, so I simply removed the environment variable for `C:\MinGw\bin` and used `C:\msys64\ucrt64\bin` for the GCC compiler. I had installed [mingw-w64-ucrt-x86_64-gcc](https://packages.msys2.org/package/mingw-w64-ucrt-x86_64-gcc?repo=ucrt64), hence why the path.

To re-install the parsers, you need to re-tpe `:TSInstall lua` or `:TSInstall c` in `nvim`.
Use `:checkhealth nvim-treesitter` to view status; a correct setup should have no ERRORs.

#### Version Control

##### [vim-fugitive](https://github.com/tpope/vim-fugitive)

Nice `git` integration within `nvim`.

One important note here is where the window pops up when you do `:G log` when you have `nvim-tree` installed for example. [See Github Issue](https://github.com/tpope/vim-fugitive/issues/326):

> This may be outside the scope of this project, and I don't know if there's an generic way to solve this, but...
When using NERDTree, if the active window is NERDTree when you do a GStatus or GCommit, the result is a very weird split in the NERDTree pane. It would be nice if it acted as those you had typed the command in the active file buffer instead of the browser buffer.
Is this possible?

My simple, manual solution to this is just make sure that `nvim-tree` is not the current ACTIVE window when using `vim-fugitive`. IE. move focus to the code or text file you're editing on the right-hand side before using `git` commands.

### Useful Keybindings
