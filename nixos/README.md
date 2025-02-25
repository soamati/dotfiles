# Common

```sh
# Rebuild
sudo nixos-rebuild switch

# Wifi connect
nmcli device wifi list
nmcli device wifi connect "<SSID>" password "<PASSWORD>"

# Backlight
sudo usermod -aG video $USER
```

# Flakes setup

```sh
sudo nix flake init --template github:vimjoyer/flake-starter-config
```
