# stevenzaluk/tap

Homebrew packages by Steven Zaluk.

## Rein

A Nord-themed Mac app for working with [Claude Code](https://code.claude.com/docs): Claude Code,
a shell and a file tree in one window per project folder, in panels that collapse and resize.

Needs an Apple Silicon Mac with macOS 13 (Ventura) or later.

```sh
brew install --cask stevenzaluk/tap/rein
```

That puts Rein in Applications and the `rein` command on your PATH: `rein [folder]` opens a
folder in Rein. Rein offers to install Claude Code if it's missing.

- Update: `brew upgrade --cask rein`
- Uninstall: `brew uninstall --cask rein` (add `--zap` to remove its settings and data too)

Rein is signed ad hoc rather than with an Apple Developer ID. After installing, the cask clears
the quarantine flag macOS puts on downloads, so Rein opens without a warning.

Releases are published here; the source isn't public. MIT license.
