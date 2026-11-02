# Romlin Homebrew tap

This tap packages [Romlin](https://github.com/romlin-emu/romlin) for Apple Silicon Macs. It is derived from the [RomP tap](https://github.com/RompEmu/homebrew-tap); Romlin is a fork of [RomP](https://github.com/RompEmu/RomP) by [Beshr](https://beshr.com). Original copyrights and license notices are retained; Romlin is GPL-3.0-or-later.

The cask is disabled until the first Romlin release has a verified checksum. Once enabled, install it with:

```sh
brew install --cask romlin-emu/tap/romlin
```

Update it with `brew upgrade --cask romlin`.

To enable the cask, set `version` to a published tag without its `v` prefix, replace `sha256 :no_check` with the SHA-256 of `Romlin-<version>-macos-arm64.zip` from that [Romlin release](https://github.com/romlin-emu/romlin/releases), confirm the archive contains `Romlin.app`, and remove `disable!`. Do not reuse a RomP archive checksum.
