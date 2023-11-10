# nix

my nixos-wsl dotfiles

### notes

- `relink` symlinks my configs to the correct directories, still needs works, since rerunning will case nested symlinks, lol
- `config/fish` folders had to be manually linked, since `.config/fish/config.fish` exists, which is system generated
- `config/tmux/tmux.conf` is symlinked to `.tmux.conf`, since somehow, home-manager generates the `.config/tmux/tmux.conf` file, but does not actually source it
- `configuration.nix` is hard linked to the real file so I could commit it
- `nix` was used as repo name, since I alr have another `dotfiles` repo, with sensitive information, so key private
