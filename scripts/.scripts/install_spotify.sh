#!/bin/bash
# sudo chmod +x install_spotify.sh
# sudo ./install_spotify.sh

# Install the repository
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Install the client
sudo apt-get update && sudo apt-get install spotify-client