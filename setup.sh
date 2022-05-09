#!/bin/zsh
set -u

INSTALL_MODE=0

echo "$@"
for arg in "$@"
do
    if [ $arg = "-i" ]; then
        INSTALL_MODE=1
    fi
done

run() {
    echo "run: $1"
    eval "$1"
    echo ""
}

# Move to dotfiles directory
DOTFILES_DIR=$(dirname $0)
cd $DOTFILES_DIR

echo "INSTALL_MODE: $INSTALL_MODE"
echo "DOTFILES_DIR: $DOTFILES_DIR"
echo ""
echo ""



# Install zinit
[ $INSTALL_MODE = 1 ] && run 'bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"'

# Install starship
[ $INSTALL_MODE = 1 ] && run 'curl -sS https://starship.rs/install.sh | sh'

# Install direnv
[ $INSTALL_MODE = 1 ] && run 'curl -sfL https://direnv.net/install.sh | bash'

# Install nvm
[ $INSTALL_MODE = 1 ] && run 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'

# Install jabba
[ $INSTALL_MODE = "1" ] && run 'curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh'

# Initialize configs
run "ln -s -f ~/dotfiles/.starship.toml ~/.starship.toml"
run "ln -s -f ~/dotfiles/.zshrc ~/.zshrc"
run "ln -s -f ~/dotfiles/.vimrc ~/.vimrc"
