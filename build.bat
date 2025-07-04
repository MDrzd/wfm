#!/bin/bash

# Hapus binary lama
[ -f wfm.exe ] && rm wfm.exe
[ -f debug.txt ] && rm debug.txt

# Compile
make -j8

echo "Build finished. Output: wfm.exe"

# Tidak perlu ./wfm.exe karena .exe tidak jalan di Linux
# Copy file ke Windows untuk run
