# Dotfiles

## Mac OS X

#### INSTALLATION NOTES

 - Install Homebrew (https://github.com/mxcl/homebrew)
 - `brew install zsh`
 - Install OhMyZsh (https://github.com/robbyrussell/oh-my-zsh)
 - Install Vundle (https://github.com/VundleVim/Vundle.vim#quick-start)
 - `brew install vim`
 - `brew install git`
 - `brew install tmux`
 - `brew install reattach-to-user-namespace --wrap-pbcopy-pbpaste && brew link reattach-to-user-namespace`
 - Install powerline fonts (https://github.com/powerline/fonts)
 - Install base16 colors (https://github.com/chriskempson/base16-iterm2)
 - Install iTerm2 (https://www.iterm2.com/)
 - In iTerm2 preferences for your profile set:
   - Character Encoding: Unicode (UTF-8)
   - Report Terminal Type: xterm-256color
 - Copy the files to `~/`
 - Execute: `vim +PluginInstall +qall` to install vim's plugins

## Ubuntu

#### INSTALLATION NOTES

To install the dotfiles, run these commands:

```bash
git clone https://github.com/claick-oliveira/dotfiles.git
cd dotfiles/ubuntu
./script.sh -a
```

##### Notes

  - `sudo apt install zsh`
  - `sudo apt install git`
  - `sudo apt install vim`
  - `sudo apt install tmux`
  - `sudo apt install terminator`
  - Install OhMyZsh (https://github.com/robbyrussell/oh-my-zsh)
  - Install Vundle (https://github.com/VundleVim/Vundle.vim#quick-start)
  - Install powerline fonts (https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a#install-powerline-font)
  - Clean fonts cache (https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a#clean-fonts-cache)
  - Move config file (https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a#move-config-file)
  - In Terminator preferences for your profile set:
    - Preferences > Profiles > Colors > Foreground and Background > Built-in schemes: Solarized dark
    - Preferences > Profiles > Colors > Palette > Built-in schemes: Solarized
  - Copy the files to `~/`
  - Execute `vim +PluginInstall +qall` to install vim's plugins
