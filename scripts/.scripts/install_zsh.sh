#!/bin/bash
# sudo chmod +x install_zsh.sh
# ./install_zsh.sh

# Install curl
if ! apt list --installed | grep -q "curl"; then 
    echo "curl not found"
    sudo apt install -y curl
fi

# Install zsh
if ! apt list --installed | grep -q "zsh"; then 
    echo "zsh not found"
    sudo apt install -y zsh
    # Set up your preferred shell
    chsh -s $(which zsh)
    # Install oh-my-zsh (optional)
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # Install plugins and themes for oh-my-zsh (optional)
    # nano ~/.zshrc 
fi

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# run p10k configure to rerun config
# sudo nala install fzf -y

# Install kitty
sudo apt install kitty
# Set kitty as the default in Gnome - this does not seem to work
gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'

# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list
