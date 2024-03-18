# dot

My personal dotfiles.

## Setup a new Mac

```sh
# Install xcode command line tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install fish shell
/opt/homebrew/bin/brew install fish

# Set fish as default shell
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# Install brew packages
brew bundle install --file=~/dot/Brewfile

# Generate ssh key
ssh-keygen -t ed25519 -C "<comment>"
eval "$(ssh-agent -s)"

# Update ssh config
echo -e "Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

# Add ssh key to keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy ssh key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

# Add ssh key to github
# https://github.com/settings/keys

# Clone this repo
git clone git@github.com:samialdury/dot.git ~/dot

# Install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

tmux
# <ctrl+b> + I (install plugins)
# <ctrl+b> + r (reload tmux)

cd ~/dot

# Sets up system preferences
make set

# Links config files
make link
```

## License

[MIT](LICENSE)
