#!/bin/bash

# Installs some dependencies then backs up existing files
# before simlinking the configuration into the home directory.
# The script is idempotent and can be run many times safely.
#
# On the first run it will backup any existing files.
# This makes sure you don't clobber any existing config
# by accident. On subsequent runs it will detect that
# the file is a symlink to ~/dotfiles and ignore it.

#echo "Installing fzf"
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &> /dev/null
#git clone --depth 1 https://github.com/Aloxaf/fzf-tab ~/.fzf-tab &> /dev/null
#~/.fzf/install --key-bindings --completion --no-update-rc --no-bash > /dev/null

#echo "Installing tilish"
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &> /dev/null

echo "Installing neovim"
curl -sSfLo  "${HOME}/tmp/nvim/nvim.appimage" --create-dirs https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x "${HOME}/tmp/nvim/nvim.appimage"
${HOME}/tmp/nvim/nvim.appimage --appimage-extract 1>/dev/null
sudo mv squashfs-root /
sudo ln -sf /squashfs-root/AppRun /usr/bin/nvim

#wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
#chmod +x nvim.appimage
#mv nvim.appimage /usr/local/bin/nvim

echo "Installing packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim


echo ""
echo "Backup the original files"
echo "-------------------------"

function backup() {
  file="$1"
  if [[ -L $file ]] && [[ "`readlink $file`" == *"dotfiles"* ]]; then
    echo "Symlink already exists for '$file'"
  elif [[ -f $file ]]; then
    if [[ ! -f "$file.old" ]]; then
      echo "Backup '$file' to '$file.old'"
      mv $file "$file.old"
    fi
  fi
}

#backup ~/.tmux.conf
backup ~/.bash_aliases
#backup ~/.gitconfig
#backup ~/.gitignore

echo ""
echo "Symlinking files:"
echo "-----------------"

function link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -rf "$to"
  ln -s "$from" "$to"
}

#link ./tmux.conf ~/.tmux.conf
cp ./bash_aliases ~/.bash_aliases
#link ~/dotfiles/gitconfig ~/.gitconfig
#link ~/dotfiles/gitignore ~/.gitignore

link ./nvim ~/.config/nvim

echo ""
echo "All done."
