# Alvin's Homebrew tap

Install macOS apps from this shared tap:

| App | What it does | Install |
| --- | --- | --- |
| [Habi](https://github.com/acltabontabon/habi) | Finds which agent skills fit your repository and installs them after a preview | `brew install --cask acltabontabon/tap/habi` |
| [Scuttle](https://github.com/acltabontabon/scuttle) | Gathers scattered files and reviews cleanup with a recoverable drawer | `brew install --cask acltabontabon/tap/scuttle` |
| [Draft Canvas](https://github.com/acltabontabon/draft-canvas) | Draws software architecture and explains how it works | `brew install --cask acltabontabon/tap/draft-canvas` |

Draft Canvas supports Apple Silicon and Intel Macs on macOS 12 or later. Its cask selects the
matching installer and checks its SHA-256 before installing `Draft Canvas.app` in Applications.
See [installation and updates](https://github.com/acltabontabon/draft-canvas/blob/main/docs/guides/desktop.md#installing).

Scuttle supports Apple silicon Macs on macOS 11 or later and Intel Macs on macOS 10.15 or later.
Its cask selects the matching installer and verifies its SHA-256 before installing `Scuttle.app`.
See [installation](https://github.com/acltabontabon/scuttle/blob/main/docs/installing.md).

For builds without Apple signing and notarization, macOS asks you to confirm the first launch:
open the app once, then **System Settings → Privacy & Security → Open Anyway** if prompted.
Homebrew preserves Gatekeeper checks. These apps update themselves using updates signed by their
own keys. To explicitly include a self-updating app in a Homebrew upgrade, use
`brew upgrade --cask --greedy acltabontabon/tap/draft-canvas` (or `habi` or `scuttle`).

Uninstalling a cask leaves application data alone. Draft Canvas diagrams, Quick Drafts and recovery
data are preserved; Scuttle's drawer, organization history and settings are preserved; Habi's
existing optional cleanup rules leave its data folder alone too.

Habi's and Draft Canvas's release workflows each write their own cask after a stable release
is published. Do not edit their generated version, URL or checksum fields by hand. Draft Canvas verifies both published DMGs,
audits the generated cask, refuses downgrades and retries concurrent tap pushes. For retry and
credential setup, see
[Homebrew releases](https://github.com/acltabontabon/draft-canvas/blob/main/docs/guides/desktop.md#homebrew-releases).

Scuttle’s cask currently tracks the published stable release manually. For each stable release,
update its version and both architecture checksums after verifying the published DMGs against
`SHA256SUMS.txt`, then run Homebrew style and cask audit checks.
