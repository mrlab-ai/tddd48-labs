#! /bin/bash

set -euo pipefail

cd $(dirname $(realpath $0))

git clone https://github.com/scipopt/soplex.git soplex
cd soplex
git checkout a5df0814d67812c13a00f06eec507b4d071fb862
cd ..
# If zlib is missing, the build may fail. To avoid this, we disable zlib.
# This removes the possibility to read gzipped LP and MPS files.
# For using SoPlex as an exact rational LP solver, SoPlex must be compiled
# with support for the [GNU Multiple Precision library](http://www.gmplib.org/)
# Since we don't need this, we simplify the installation by deactivating it.
cmake -S soplex -B build -DZLIB=false -DGMP=false
cmake --build build
rm -rf soplex/
mv build/bin/soplex soplex
rm -rf build/
