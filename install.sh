#!/bin/bash

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &> /dev/null
git clone --depth 1 https://github.com/Aloxaf/fzf-tab ~/.fzf-tab &> /dev/null
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash > /dev/null

echo "Installing neovim"
curl -sSfLo  "${HOME}/tmp/nvim/nvim.appimage" --create-dirs https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x "${HOME}/tmp/nvim/nvim.appimage"
${HOME}/tmp/nvim/nvim.appimage --appimage-extract 1>/dev/null
sudo mv squashfs-root /
sudo ln -sf /squashfs-root/AppRun /usr/bin/nvim

echo "Installing packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim


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
cp -R ./nvim ~/.config/

echo ""
echo "All done."
