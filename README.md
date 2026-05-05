Rebuild

```bash
sudo nixos-rebuild switch --flake .#nixos-laptop --show-trace
```

Update

```bash
nix flake update
```

Clean

```bash
nh clean all
nix-store --optimise
```
