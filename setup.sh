#!/bin/zsh

run() {
    echo "run: $1"
    eval "$1"
    echo ""
}

# Install zinit
run 'bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"'

# Install starship
run 'curl -sS https://starship.rs/install.sh | sh'

# Install direnv
run 'curl -sfL https://direnv.net/install.sh | bash'

# Install nvm
run 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'

# Install jabba
run 'curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh'

# Initialize configs
run "ln -s -f ~/dotfiles/.starship.toml ~/.starship.toml"
run "ln -s -f ~/dotfiles/.zshrc ~/.zshrc"
run "ln -s -f ~/dotfiles/.vimrc ~/.vimrc"
