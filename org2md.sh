#! /usr/bin/zsh

pandoc -f org -t dzslides  -o node.html --indented-code-classes=javascript \
    --highlight-style=zenburn -s node.org

# --slide-level=4
# --self-contained
