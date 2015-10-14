#! /usr/bin/zsh

pandoc -f markdown -t dzslides -o node.html --indented-code-classes=javascript \
    --highlight-style=zenburn -s node.md --template=default.dzslides

# --slide-level=4

# --self-contained
