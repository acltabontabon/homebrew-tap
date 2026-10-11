# Alvin's Homebrew tap

Install macOS apps from this shared tap:

| App | What it does | Install |
| --- | --- | --- |
| [Habi](https://github.com/acltabontabon/habi) | Finds which agent skills fit your repository and installs them after a preview | `brew install --cask acltabontabon/tap/habi` |
| [Draft Canvas](https://github.com/acltabontabon/draft-canvas) | Draws software architecture and explains how it works | `brew install --cask acltabontabon/tap/draft-canvas` |

Draft Canvas supports Apple Silicon and Intel Macs on macOS 12 or later. Its cask selects the
matching installer and checks its SHA-256 before installing `Draft Canvas.app` in Applications.
See [installation and updates](https://github.com/acltabontabon/draft-canvas/blob/main/docs/guides/desktop.md#installing).

For builds without Apple signing and notarization, macOS asks you to confirm the first launch:
open the app once, then **System Settings → Privacy & Security → Open Anyway** if prompted.
Homebrew preserves Gatekeeper checks. Both apps update themselves using updates signed by their
own keys. To explicitly include a self-updating app in a Homebrew upgrade, use
`brew upgrade --cask --greedy acltabontabon/tap/draft-canvas` (or `habi`).

Uninstalling a cask leaves application data alone. Draft Canvas diagrams, Quick Drafts and recovery
data are preserved; Habi's existing optional cleanup rules leave its data folder alone too.

Each app's release workflow writes only its own cask after a stable release is published. Do not
edit generated version, URL or checksum fields by hand. Draft Canvas verifies both published DMGs,
audits the generated cask, refuses downgrades and retries concurrent tap pushes. For retry and
credential setup, see
[Homebrew releases](https://github.com/acltabontabon/draft-canvas/blob/main/docs/guides/desktop.md#homebrew-releases).
