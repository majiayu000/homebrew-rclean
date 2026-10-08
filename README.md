# homebrew-rclean

Homebrew tap for [rclean](https://github.com/majiayu000/rclean), a
Rust CLI that finds and safely cleans rebuildable developer artifacts.

```bash
brew install majiayu000/rclean/rclean
```

## Status

The current formula installs [rclean v0.2.0](https://github.com/majiayu000/rclean/releases/tag/v0.2.0).

- **macOS (Apple Silicon and Intel):** installs prebuilt binaries from the
  GitHub release archives.
- **Linux:** builds the tagged source archive with Cargo. Homebrew installs
  Rust as a build dependency; installation takes longer than using a prebuilt binary.

## Updating

Refresh Homebrew's package metadata, then upgrade this tap's formula:

```bash
brew update
brew upgrade majiayu000/rclean/rclean
```

Use `brew info majiayu000/rclean/rclean` to check the version available in this tap.
An upstream release becomes available through Homebrew once the formula is updated.

## How updates work

The release workflow in `majiayu000/rclean` rewrites `Formula/rclean.rb`
(version and checksums) on every tagged release and pushes here.
Manual edits to the formula will be overwritten by the next release.
