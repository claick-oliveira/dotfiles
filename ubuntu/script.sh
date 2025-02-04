#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Treat unset variables as an error and exit immediately
set -u

# Function to display usage information
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h, --help                     Show this help message"
    echo "  -p, --install-packages         Install the packages"
    echo "  -z, --install-ohmyzsh          Install oh-my-zsh"
    echo "  -v, --install-vundle           Install vundle"
    echo "  -f, --install-powerline-fonts  Install powerline fonts"
    echo "  -c, --copy-files               Copy configuration files"
    # ...add more options as needed...
}

# Function to install required packages
install() {
    # Update package list
    sudo apt-get update

    # Install packages
    echo "Installing zsh..."
    sudo apt-get install -y zsh
    echo "Installing git..."
    sudo apt-get install -y git
    echo "Installing vim..."
    sudo apt-get install -y vim
}

# Function to install ohmyzsh
install_ohmyzsh() {
    # Install oh-my-zsh
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

#Function to install vundle
install_vundle() {
    # Install vundle
    echo "Installing vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Remeber to copy the .vimrc and run vim +PluginInstall +qall"
}

#Install powerline fonts
install_powerline_fonts() {
    # Install powerline fonts
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts/
    mv PowerlineSymbols.otf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d #if directory doesn't exists
    fc-cache -vf ~/.fonts/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    sudo apt-get install dconf-cli
    git clone https://github.com/aruhier/gnome-terminal-colors-solarized ~/.solarized
    ~/.solarized/install.sh
}

# Function to copy files
copy_files() {
    # Copy files to home
    echo "Copying configuration files..."
    cp -pr .zshrc ~/
    cp -pr .vimrc ~/
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
      -h|--help)
        usage
        exit 0
        ;;
      -p|--install-packages)
        install
        exit 0
        ;;
      -z|--install-ohmyzsh)
        install_ohmyzsh
        exit 0
        ;;
      -v|--install-vundle)
        install_vundle
        exit 0
        ;;
      -f|--install-powerline-fonts)
        install_powerline_fonts
        exit 0
        ;;
      -c|--copy-files)
        copy_files
        exit 0
        ;;
      -a|--install-all)
        install
        install_ohmyzsh
        install_vundle
        install_powerline_fonts
        copy_files
        vim +PluginInstall +qall
        exit 0
      *)
        echo "Unknown parameter passed: $1"
        usage
        exit 1
        ;;
    esac
done
