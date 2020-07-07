# neovim config
1. install [vim-plug](https://github.com/junegunn/vim-plug), it's a simple copy pasting of a file
2. copy init.vim in ~/.config/nvim/init.vim (or ~/.vimrc if you're using vim)
3. start neovim and download the packages with the commmand :PlugInstall, keep them up to date with :PlugUpdate 
4. restart neovim and enjoy 

**Note that some auto formating/compiling requires other programs/scripts and might not work out of the box on any m-achine**

## I don't want to RTFM
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


# latex\_compile.sh
A script that compile your .tex file without having to type 4 times pdflatex

# fish setup
- [omf](https://github.com/oh-my-fish/oh-my-fish)
- copy config.fish into ~/.config/fish/conf.d

