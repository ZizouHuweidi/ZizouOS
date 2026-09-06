# zen

bootc images for a clean dev setup.

## Installation

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:

  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/zizouhuweidi/zen-gnome:latest
  ```

  other images available: zen-gnome-nvidia, zen-sway, zen-sway-nvidia, zen-cosmic, zen-cosmic-nvidia

- Reboot to complete the rebase:

  ```
  systemctl reboot
  ```

- Then rebase to the signed image, like so:

  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/zizouhuweidi/zen-gnome:latest
  ```

- Reboot again to complete the installation

  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in the selected `recipes/recipe-*.yml`, so you won't get accidentally updated to the next major version.
