#! /usr/bin/env zsh

pandoc -f markdown -t dzslides -o node.html \
    -s node_and_js6.md --template=default.dzslides \
    --highlight-style=zenburn --indented-code-classes=javascript 

# --slide-level=4
# --self-contained
