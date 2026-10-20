# Tap maintenance

This is a personal tap containing macOS casks. App development and release builds live in the individual app repositories.

## Release ownership

| Cask | Updated by | Release instructions |
| --- | --- | --- |
| `habi` | Habi’s Homebrew workflow after a stable release is published | [Habi release guide](https://github.com/acltabontabon/habi/blob/main/docs/dev/release.md) |
| `draft-canvas` | Draft Canvas’s Homebrew workflow after desktop publication | [Draft Canvas Homebrew releases](https://github.com/acltabontabon/draft-canvas/blob/main/docs/guides/desktop.md#homebrew-releases) |
| `scuttle` | Manually in this tap | [Scuttle releases](https://github.com/acltabontabon/scuttle/releases) |

Habi and Draft Canvas generate the entire cask file. Make lasting changes in their upstream `scripts/homebrew-cask.mjs` generators so the next release preserves them. Retry a failed publication from the app repository’s Homebrew workflow; credential setup belongs there too.

For Scuttle, update the version and both architecture checksums together. Download the stable release’s Apple silicon and Intel DMGs and `SHA256SUMS.txt`, then verify both DMGs with `shasum -a 256 -c SHA256SUMS.txt --ignore-missing`. Never replace checksums with `:no_check`, overwrite a published release asset, or publish a prerelease through these stable casks.

## Checks

The [Tap checks workflow](../.github/workflows/tap-checks.yml) runs on pull requests, pushes to `main`, manual dispatch, and weekly. It checks Homebrew style, loads every cask for both Mac architectures, downloads the installers to verify their SHA-256 checksums, and runs online audits against the app bundles. It does not launch the apps.

To check committed changes locally without changing an existing installation of this tap:

```sh
brew tap local/tap-check "$PWD"
brew trust --tap local/tap-check
brew style local/tap-check
brew readall --arch=all local/tap-check
brew fetch --cask --arch=all local/tap-check/{draft-canvas,habi,scuttle}
brew audit --cask --online --arch=all --except=token_conflicts local/tap-check/{draft-canvas,habi,scuttle}
brew untap local/tap-check
```

Run these from this repository using current Homebrew. The local tap is a clone of the current commit, so commit changes before using these commands. Always remove the temporary tap when finished, including after a failed check. Online checks require network access and working upstream releases.

The audit skips only `token_conflicts`: commands use fully qualified cask names, so collisions with core formula names do not affect installation. Homebrew’s collision check otherwise clones the entire `homebrew/core` repository. Installer, checksum, bundle, and minimum macOS checks remain enabled.

## Cask policy

- Keep installers pinned to published stable versions and exact SHA-256 checksums.
- Verify both architectures and the minimum macOS version declared by the shipped app bundle.
- Preserve Gatekeeper checks and document first-launch requirements.
- Keep `auto_updates true` for apps with their own updater.
- Preserve user documents and recovery data on uninstall. Review optional `zap` paths carefully; Habi currently removes only caches, preferences, saved window state, and WebKit data.

CI uses a read-only GitHub token and pins actions to commit SHAs. Dependabot proposes action updates monthly. The tap does not need release credentials: app repositories own their publication workflows.
