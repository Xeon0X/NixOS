Rebuild

```bash
sudo nixos-rebuild switch --flake . --show-trace
```

Update

```bash
nix flake update
```

Clean

```bash
sudo nix-collect-garbage -d
nix-shell -p nh
nh clean all
```
