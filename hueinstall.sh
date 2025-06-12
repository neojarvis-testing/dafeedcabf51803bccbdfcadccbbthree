# Install dependencies
sudo apt update
sudo apt install -y git gcc g++ make python3-dev python3-venv libkrb5-dev libsasl2-dev libldap2-dev libssl-dev libmysqlclient-dev

# Clone Hue source code
git clone https://github.com/cloudera/hue.git
cd hue

# Create virtualenv and activate
python3 -m venv venv
source venv/bin/activate

# Install Python packages
make apps

# Start Hue
build/env/bin/supervisor
