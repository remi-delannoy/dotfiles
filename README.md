# WARNING !!!
This files are written for archlinux with `installed_packages` installed.

It's very unlikely that everythings work out-of-the-box on an other environment.

Common issues:
- `zsh-autosuggestions` and/or `zsh-syntax-highlighting` not installed or not where they are expected to be by .zshrc
- `npm` not installed (for coc.nvim)
- `python(3)-venv` not installed (for coc-jedi)
- `python-black` not installed (for python files auto formating)
- `clang-format` not installed (for C-like files auto formating)
- `bash-language-server` not installed (for bash files LSP)
- [latex\_compile](https://github.com/remi-delannoy/dotfiles#misc) not in $HOME/.local/bin (for auto compilation of tex files)

## Quick installation
**WARNING: it will replace your init.vim and some other config files, you might want to back them up**

`curl -fsSL https://raw.githubusercontent.com/remi-delannoy/dotfiles/master/quickinstall.sh | sh`


### What do I install?
#### With the quick install
- alacritty config 
- neovim config (and some plugins)
- zsh config 
- nice ls colors
#### With the full install
In addition to the previous things:
- sway config
- mako config
- i3blocks config

## Neovim plugins: I don't want to RTFM, can you give me a TL;DR? 
- leader = comma
- ctrl-p = fuzzy file search
- gd = go to definition (gy,gi and gr for type def, implementation and reference) 
- leader+rn = rename the symbol under the cursor
- leader+qf = try to quickfix
- [g & ]g : jump to the next/previous diagnostic
- leader+motion = easy motion
- visual selection + S + surrounding = add the surrounding arround the selection; opening surroundings add a space, closing ones don't
- you can do other cool things like cs)] to replace the surrounding paranthesis with brackets
- leader+o = open buffer explorer
- ctrl+hjkl = navigate between splits

## I want more documentation
- [vim-plug](https://github.com/junegunn/vim-plug)
- [ayu](https://github.com/ayu-theme/ayu-vim)
- [coc](https://github.com/neoclide/coc.nvim)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-easymotion](https://github.com/easymotion/vim-easymotion)
- [ctrlp](https://github.com/kien/ctrlp.vim)
- [julia-vim](https://github.com/JuliaEditorSupport/julia-vim)

### Misc
- latex\_compile.sh: A script which compiles your .tex file without having to type 4 times pdflatex and polluting your directory with multiple files

