#!/bin/bash
# * setup gem5 config
readonly TOP="./gem5"
readonly ISA=X86
readonly BIN=opt

# * do the trick
SRC="$(dirname "$1")"
for src in $SRC/*.py; do
    # ? make a backup, comment "from config."
    sed -i.bak "/from config./ s/^/# /" "$src"
    sed -i "1i\import m5\nfrom m5.objects import *" "$src"
done

# * execute
$TOP/build/$ISA/gem5.$BIN $1 ${@:2}

# * restore
for bak in $SRC/*.py.bak; do
    mv "$bak" "${bak%.py.bak}.py"
done