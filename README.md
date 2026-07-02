# homebrew-rclean

Homebrew tap for [rclean](https://github.com/majiayu000/rclean), a
Rust CLI that finds and safely cleans rebuildable developer artifacts.

```bash
brew install majiayu000/rclean/rclean
```

## Status

The formula installs prebuilt binaries from rclean's GitHub Releases.
It activates with the first tagged release (`v0.2.0`); until then the
formula carries placeholder checksums and `brew install` will fail.

## How updates work

The release workflow in `majiayu000/rclean` rewrites `Formula/rclean.rb`
(version + per-target sha256) on every tagged release and pushes here.
Manual edits to the formula will be overwritten by the next release.
