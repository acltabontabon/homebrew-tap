# Homebrew tap for Habi

[Habi](https://github.com/acltabontabon/habi) finds which agent skills fit your repository and installs them, after showing you every file first.

```sh
brew install --cask acltabontabon/tap/habi
```

Habi's installers are not signed or notarized by Apple, so macOS asks you to confirm the first
launch once: **System Settings → Privacy & Security → Open Anyway**. Homebrew does not bypass that
check, and neither does this tap. After that Habi updates itself, with updates signed by Habi's
own key.

`Casks/habi.rb` is written by Habi's release workflow each time a release is published; do not
edit it by hand.
