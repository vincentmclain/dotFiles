#!/bin/bash
# sudo chmod +x install_git.sh
# ./install_git.sh

# Install git
    sudo apt install -y git
    wget "https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.5.0/gcm-linux_amd64.2.5.0.deb" -O /tmp/gcmcore.deb
    sudo dpkg -i /tmp/gcmcore.deb
    git-credential-manager configure
    #git config --global credential.credentialStore cache
    git config --global credential.helper store
    git config --global user.email "vincent.mclain@gmail.com"
    git config --global user.name "Vincent McLain"
    git config --global core.editor "code --new-window --wait"
    git config --global commit.template ~/.gitmessage.txt
    
    # Add the merge tools 
    echo "[diff]" >> ~/.gitconfig
    echo "    tool = default-difftool" >> ~/.gitconfig
    echo "[difftool \"default-difftool\"]" >> ~/.gitconfig
    echo "    cmd = code --wait --diff $LOCAL $REMOTE" >> ~/.gitconfig
    echo "[merge]" >> ~/.gitconfig
    echo "    tool = default-mergetool" >> ~/.gitconfig   
    echo "[mergetool \"default-mergetool\"]" >> ~/.gitconfig 
    echo "    cmd = code --wait \$MERGED" >> ~/.gitconfig


    # Create the gitmessage file (if it doesn't exist)
    touch ~/.gitmessage.txt
    echo "Subject line (try to keep under 50 characters)" > ~/.gitmessage.txt
    echo "" >> ~/.gitmessage.txt
    echo "Multi-line description of commit, feel free to be detailed." >> ~/.gitmessage.txt
    echo "" >> ~/.gitmessage.txt
    echo "[Ticket: X]" >> ~/.gitmessage.txt 

    # Create the global gitignore file (if it doesn't exist)
    touch ~/.gitignore_global
    echo "*~" > ~/.gitignore_global
    echo ".*.swp" >> ~/.gitignore_global
    echo ".DS_Store" >> ~/.gitignore_global
    echo "*.gz" >> ~/.gitignore_global
    echo "*.tmproj" >> ~/.gitignore_global
    echo "*.7z" >> ~/.gitignore_global
    echo ".vscode/*" >> ~/.gitignore_global
    echo "build/*" >> ~/.gitignore_global

    # JetBrains Rider
    echo ".idea/" >> ~/.gitignore_global
    echo "*.sln.iml" >> ~/.gitignore_global

    # NuGet Packages
    echo "*.nupkg" >> ~/.gitignore_global
    # Build results
    echo "[Dd]ebug/" >> ~/.gitignore_global
    echo "[Dd]ebugPublic/" >> ~/.gitignore_global
    echo "[Rr]elease/" >> ~/.gitignore_global
    echo "x64/" >> ~/.gitignore_global
    echo "x86/" >> ~/.gitignore_global
    echo "bld/" >> ~/.gitignore_global
    echo "[Bb]in/" >> ~/.gitignore_global
    echo "[Oo]bj/" >> ~/.gitignore_global
    echo "[Ll]og/" >> ~/.gitignore_global

