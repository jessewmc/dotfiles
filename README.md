tmux tilish:
install tmux
install plugin manager https://github.com/tmux-plugins/tpm
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
copy tmux.conf from this repo
https://github.com/jabirali/tmux-tilish
`Ctrl + b followed by Shift + i` to install plugins


remap modifiers to use command as alt:
https://iterm2.com/documentation-preferences-keys.html
Also to use option as alt, change profile -> keys to remap as esc+
NOTE: What I really want is not to remap, just to get certain key combos
working. Will need to enumerate these for i3 shortcuts, but most likely:
meta+enter
meta+hjkl
meta+shift+hjkl
meta+v, h?
meta+semicolon split h
meta+swe
resize mode meta+r


FONT:
https://github.com/tonsky/FiraCode
see install instructions

neovim
`wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage`
`chmod +x nvim.appimage`
`sudo mv nvim.appimage /usr/local/bin/nvim`

Open problems: How to send tmux commands to overmind within tmux

install packer:
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

# codespaces
```
$ gh codespace ssh --config > ~/.ssh/codespaces
$ echo 'include ~/.ssh/codespaces' >> ~/.ssh/config'
```
To keep the stupid connection alive, send a `ServerAliveInteravl`:
```
Host *
  ServerAliveInterval 60
```
http://www.kehlet.cx/articles/129.html
