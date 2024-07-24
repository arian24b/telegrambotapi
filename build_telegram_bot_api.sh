#!/bin/bash

set -e

# Update and upgrade the system
sudo apt-get update
sudo apt-get upgrade -y

# Install required dependencies
sudo apt-get install -y make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-14-dev libc++abi-14-dev

# Clone the telegram-bot-api repository
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api

# Create build directory
rm -rf build
mkdir build
cd build

# Set environment variables and build the project
CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-14 CXX=/usr/bin/clang++-14 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target install

# Verify the installation
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*
