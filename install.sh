#!/usr/bin/env bash

# ssh repo
mkdir ~/.ssh
chmod 700 ~/.ssh

# Homebrew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/cask

ln -s $(pwd)/env/.gitconfig ~/.
ln -s $(pwd)/env/.gitignore ~/.
ln -s $(pwd)/env/.zshrc ~/.
ln -s $(pwd)/env/.alias ~/.

# ZSH
brew install zsh zsh-completions
brew cask install iterm2
chsh -s /bin/zsh

# Utils
brew install bat terminal-notifier tmate htop thefuck the_silver_searcher glances unrar p7zip youtube-dl gpg
brew cask install keybase iina spectacle telegram spotify transmission the-unarchiver appcleaner

# Languages
brew install go crystal node

# Dev tools
brew install git mkcert wellington
brew cask install slack insomnia virtualbox sequel-pro ngrok visual-studio-code firefox-developer-edition firefox google-chrome microsoft-edge nucleo screaming-frog-seo-spider
npm install -g svgo
npm install -g gatsby-cli

# Python tools
sudo easy_install pip

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

# Docker and Dinghy
brew tap codekitchen/dinghy
brew install docker docker-machine docker-compose dinghy
mkdir $HOME/.dinghy
/bin/cat <<EOM >$HOME/.dinghy/preferences.yml
---
:preferences:
  :unfs_disabled: false
  :proxy_disabled: true
  :dns_disabled: false
  :fsevents_disabled: false
  :create:
    memory: 4096
    cpus: 2
    disk: 30000
    provider: xhyve
EOM
dinghy create

# Remove apache
sudo apachectl -k stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Update PHP
brew install php@7.3

brew cleanup

# Prompt and fonts
npm install --global pure-prompt
clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# osx conf
defaults write com.apple.Terminal FocusFollowsMouse -string YES

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
#defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Make dock transparent
defaults write com.apple.dock hide-mirror -bool true

sudo shutdown -r now
