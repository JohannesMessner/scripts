#!/bin/bash

# Update and install system dependencies
apt-get update && apt-get install -y git curl build-essential

# Install pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Make sure pipx binaries are available in the current session
export PATH=$PATH:$HOME/.local/bin

# Install Poetry via pipx
pipx install poetry

# Install Rust and Cargo (this script handles the environment)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source Rust environment for the current session
source $HOME/.cargo/env

# Clone your repository
git clone https://github.com/JohannesMessner/reason_net.git
cd reason_net

# Install dependencies via Poetry
poetry install

# You might need to source the profile if the installations above require it
# It's also a good idea to ensure that any terminal opened afterwards has access to these tools
echo 'source $HOME/.cargo/env' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc

source ~/.bashrc
source $HOME/.cargo/env

echo "Setup completed!"

