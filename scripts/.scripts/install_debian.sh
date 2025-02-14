#!/bin/bash
# sudo chmod +x install_debian.sh
# sudo ./install_debian.sh

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install curl
if ! apt list --installed | grep -q "curl"; then
    echo "curl not found"
    sudo apt install -y curl
fi

# Install wget
if ! apt list --installed | grep -q "wget"; then
    echo "wget not found"
    sudo apt install -y wget
fi

# Install git

# Install snap if it does not exist
if ! apt list --installed | grep -q "snapd"; then
    echo "snapd not found"
    sudo apt install snapd
fi


# Install microsoft-edge
if ! apt list --installed | grep -q "microsoft-edge"; then
    echo "microsoft-edge not found"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
    sudo rm microsoft.gpg
    sudo apt update
    sudo apt install -y microsoft-edge-stable
fi

# Install brave-browser
if ! apt list --installed | grep -q "brave-browser"; then
    echo "brave-browser not found"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install -y brave-browser
fi

#Remove firefox
if apt list --installed | grep -q "firefox"; then
    echo "firefox apt found"
    sudo apt remove firefox
    sudo apt purge firefox
    sudo apt-get purge firefox
    sudo rm -Rf /etc/firefox
    # Might need to also remove snap
fi

#Remove firefox
if snap list | grep -q "firefox"; then
    echo "firefox snap found"
    sudo snap remove firefox
    sudo rm -Rf /etc/firefox
fi

# Install gdebi
if ! apt list --installed | grep -q "gdebi"; then
    echo "gdebi not found"
    sudo apt install -y gdebi
fi

# Install nodejs
if ! apt list --installed | grep -q "nodejs"; then
    echo "nodejs not found"
    sudo apt install -y nodejs
fi

# Install npm
if ! apt list --installed | grep -q "npm"; then
    echo "npm not found"
    sudo apt install -y npm
fi

# Install java
if ! apt list --installed | grep -q "java"; then
    echo "java not found"
    sudo apt install -y java
fi

# Install python
if ! apt list --installed | grep -q "python3"; then
    echo "python3 not found"
    sudo apt install -y python3
    sudo apt install -y python3-pip
    sudo apt install -y python3-venv
fi

# Install other useful tools
# Install tree
if ! apt list --installed | grep -q "tree"; then
    echo "tree not found"
    sudo apt install -y tree
fi

# Install unzip
if ! apt list --installed | grep -q "unzip"; then
    echo "unzip not found"
    sudo apt install -y unzip
fi

# Install zip
if ! apt list --installed | grep -q "zip"; then
    echo "zip not found"
    sudo apt install -y zip
fi

# Install Docker
if ! apt list --installed | grep -q "docker.io"; then
    echo "docker.io not found"
    sudo apt install -y docker.io
    sudo usermod -aG docker $USER
fi

# Install docker-compose
if ! apt list --installed | grep -q "docker-compose"; then
    echo "docker-compose not found"
    sudo apt install -y docker-compose
fi

# Install zsh
if ! apt list --installed | grep -q "zsh"; then
    echo "zsh not found"
    sudo apt install -y zsh
    # Set up your preferred shell
    chsh -s /bin/zsh
    # Install oh-my-zsh (optional)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # Install plugins and themes for oh-my-zsh (optional)
    code ~/.zshrc
fi

# Install dotnet-sdk-8.0
if ! apt list --installed | grep -q "dotnet-sdk-8.0"; then
    echo "dotnet-sdk-8.0 not found"
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb

    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-8.0

    sudo apt-get update && \
    sudo apt-get install -y aspnetcore-runtime-8.0
fi


# Install rider https://vegastack.com/tutorials/how-to-install-rider-on-ubuntu-22-04/
if ! apt list --installed | grep -q "rider"; then
    echo "Rider not found"
    sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https curl lsb-release -y
    curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
    sudo apt update
    sudo apt install rider
fi

# Install vlc
if ! apt list --installed | grep -q "vlc"; then
    echo "vlc not found"
    sudo apt install -y vls
fi

# Install protonpass
if ! apt list --installed | grep -q "ProtonPass"; then
    echo "ProtonPass not found"
    wget https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb
    sudo gdebi ProtonPass.deb
fi

# Install spotify
# https://itsfoss.com/install-spotify-ubuntu-linux/
if ! snap list | grep -q "spotify"; then
    echo "spotify snap not found"
    sudo snap install spotify
fi






echo "Installation complete!"
exist

# This is an option installation for development
# https://www.youtube.com/watch?v=hKGPH9C-EFc
# zsh shell
sudo apt update && sudo apt install zsh
# Change the default shell
sudo chsh -s $(which zsh)
# Install oh my zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Insall nerd fonts
# Download the font
# Put the unzipped files into ~/.local/share/fonts
# Update the font cache : fc-cache -fv
# Neovim configuration
# https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn
sudo apt-get install neovim
sudo apt-get install python3-neovim
# Create init file
# nvim ~/.config/nvim/init.lua
