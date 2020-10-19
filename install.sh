#!/usr/bin/env bash

# ssh repo
mkdir ~/.ssh
chmod 700 ~/.ssh

# Homebrew
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap

ln -s $(pwd)/env/.gitconfig ~/.
ln -s $(pwd)/env/.gitignore ~/.
ln -s $(pwd)/env/.zshrc ~/.
ln -s $(pwd)/env/.alias ~/.

# ZSH
brew install zsh zsh-completions
chsh -s /bin/zsh

# Utils
brew install bat terminal-notifier tmate htop thefuck the_silver_searcher glances unrar p7zip youtube-dl 1password
brew cask install iina rectangle alfred3 cleanmymac3 

# Languages
brew install go crystal node ruby

# Ruby
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Dev tools
brew install git mkcert wellington
brew cask install slack iterm2 insomnia virtualbox sequel-pro ngrok visual-studio-code firefox-developer-edition firefox google-chrome microsoft-edge nucleo screaming-frog-seo-spider charles nucleo sketch zeplin
npm install -g svgo
npm install -g gatsby-cli
npm install -g react-devtools
npm install --global asciicast2gif

# Python tools
sudo easy_install pip

# Update PHP
brew install php@7.3
echo 'export PATH="/usr/local/opt/php@7.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.3/sbin:$PATH"' >> ~/.zshrc

# Composer
brew install mcrypt
brew install composer

# Remove apache
sudo apachectl -k stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist

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
