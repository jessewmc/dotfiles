3mux for terminal multiplexing because I use i3 and tmux has terrible keybindings:
https://github.com/aaronjanse/3mux

Problems on brew version: https://github.com/aaronjanse/3mux/issues/121
TLDR: launch with `TMPDIR=/tmp 3mux`


install tmux
install plugin manager https://github.com/tmux-plugins/tpm
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
Put at bottom of tmux.conf:
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

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
