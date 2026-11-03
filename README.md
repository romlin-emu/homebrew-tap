# Romlin Homebrew tap

This tap packages [Romlin](https://github.com/romlin-emu/romlin) for Apple Silicon Macs. It is derived from the [RomP tap](https://github.com/RompEmu/homebrew-tap); Romlin is a fork of [RomP](https://github.com/RompEmu/RomP) by [Beshr](https://beshr.com). Original copyrights and license notices are retained; Romlin is GPL-3.0-or-later.

The cask is disabled until the first Romlin release has a verified checksum. Once enabled, install it with:

```sh
brew install --cask romlin-emu/tap/romlin
```

Update it with `brew upgrade --cask romlin`.

## Maintainer checks

On macOS with Homebrew installed, register this checkout as `romlin-emu/tap` so checks use your local edits. From the repository root, if that tap is not already registered:

```sh
tap_dir="$(brew --repository)/Library/Taps/romlin-emu/homebrew-tap"
mkdir -p "$(dirname "$tap_dir")"
ln -s "$PWD" "$tap_dir"
brew trust romlin-emu/tap
```

If the tap already exists, use its checkout or run `brew untap romlin-emu/tap` before registering this one. Confirm `brew --repository romlin-emu/tap` resolves to this checkout, then run:

```sh
brew style --cask romlin-emu/tap/romlin
brew audit --cask romlin-emu/tap/romlin
```

CI runs these checks on macOS for pushes and pull requests, with the checked-out revision registered as the tap. These checks do not verify installation or download the application. Keep the cask disabled while only nightly builds exist; do not use `--online` or install the unpublished version.

## Updating a verified release

Once a stable [Romlin release](https://github.com/romlin-emu/romlin/releases) is published, download its versioned macOS ARM64 ZIP and matching `.sha512` file into an empty directory. Substitute the published version for `X.Y.Z`:

```sh
version=X.Y.Z
archive="Romlin-${version}-macos-arm64.zip"
release_url="https://github.com/romlin-emu/romlin/releases/download/v${version}"
curl --fail --location --output "$archive" "$release_url/$archive"
curl --fail --location --output "$archive.sha512" "$release_url/$archive.sha512"
shasum -a 512 -c "$archive.sha512"
unzip -t "$archive"
unzip -l "$archive"
shasum -a 256 "$archive"
```

Proceed only if the published SHA-512 matches, the ZIP passes its integrity check, and its listing contains `Romlin.app` at the archive root. In `Casks/romlin.rb`, set `version` without the tag's `v` prefix, replace `sha256 :no_check` with the calculated SHA-256, confirm the interpolated URL names that exact archive, and remove `disable!`. Do not reuse a RomP archive checksum. Run the maintainer checks above, then verify `brew install --cask romlin-emu/tap/romlin` on an Apple Silicon Mac after publication and enabling the cask.
