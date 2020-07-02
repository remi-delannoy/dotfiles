#!/usr/bin/sh
if [ "$1" = "" ]
then
    echo 'Usage latex_compile.sh tex_file'
    exit
fi
fullname="$(realpath "$1")"
dirname=$(dirname "$fullname")
name="$(basename "$fullname" | sed 's/\.tex$//')"
cd "$dirname"
pdflatex -halt-on-error -output-directory=/tmp "$fullname"
if [ $? -ne 0 ];then
    name="main"
    fullname="$dirname/$name.tex"
    pdflatex -halt-on-error -output-directory=/tmp "$fullname"
fi
cp *.bib /tmp
cd /tmp
bibtex "$name"
cd "$dirname"
pdflatex -halt-on-error -output-directory=/tmp "$fullname"
pdflatex -halt-on-error -output-directory=/tmp "$fullname"
cp "/tmp/$name.pdf" .





