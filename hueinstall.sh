#!/bin/bash

# Update and install dependencies
sudo apt update
sudo apt install -y \
  git gcc g++ make \
  python3-dev python3-venv \
  libkrb5-dev libsasl2-dev \
  libldap2-dev libssl-dev \
  libmariadb-dev-compat libmariadb-dev \
  build-essential

# Clone the Hue repository
git clone https://github.com/cloudera/hue.git
cd hue || exit

# Create and activate a virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python packages and build Hue
make apps

# Start Hue
build/env/bin/supervisor
