#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

echo "SCRIPT_DIR: $SCRIPT_DIR"

# Install Pangolin
cd $SCRIPT_DIR/thirdparty
unzip Pangolin.zip
cd $SCRIPT_DIR/thirdparty/Pangolin
cmake -S . -B build -GNinja
sudo cmake --build build -j2 --target install
# To prevent the error below, ldconfig has to be executed.
# error while loading shared libraries: libpango_windowing.so: cannot open shared object file: No such file or directory
sudo ldconfig

# Install g2o
cd $SCRIPT_DIR/thirdparty/g2o
cmake -S . -B build -GNinja
sudo cmake --build build -j2 --target install

# Install main repo
cd $SCRIPT_DIR
cmake -S . -B build -GNinja
cmake --build build -j2

# When there is a gmock error, see https://github.com/gaoxiang12/slam_in_autonomous_driving/issues/18.
# rm build/CMakeCache.txt
# cmake -S . -B build -GNinja
# cmake --build build -j2
