## Quick installation

` curl -fsSL https://raw.githubusercontent.com/remi-delannoy/dotfile/master/quickinstall.sh | sh `

**WARNING: it will delete your init.vim and some other config files, you might want to backup them**

### What do I install?
- alacritty config
- nvim config
- fish config
- nice ls colors

**Note that some auto formating/compiling in init.vim requires other programs/scripts and might not work out of the box on any machine**

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

