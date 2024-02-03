#!/bin/bash

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &> /dev/null
git clone --depth 1 https://github.com/Aloxaf/fzf-tab ~/.fzf-tab &> /dev/null
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash > /dev/null

echo "Installing mcfly"
brew install mcfly
echo "eval \"$(mcfly init zsh)\"" >> ~/.zprofile

echo "Installing neovim"
brew install neovim

echo "Installing packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "!!!!!"
echo "Make sure to run :PackerSync"

echo "Installing ripgrep"
brew install ripgrep


echo ""
echo "Backup the original files"
echo "-------------------------"

function backup() {
  file="$1"
  if [[ -f $file ]]; then
    if [[ ! -f "$file.old" ]]; then
      echo "Backup '$file' to '$file.old'"
      mv $file "$file.old"
    fi
  fi
}

backup ~/.bash_aliases

echo ""
echo "Copying files"
echo "-----------------"

cp ./bash_aliases ~/.bash_aliases
mkdir -p ~/.config/
cp -R ./nvim ~/.config/nvim

echo ""
echo "All done."
