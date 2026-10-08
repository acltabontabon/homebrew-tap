cask "habi" do
  version "0.2.0"
  sha256 "e14b5bf9de58c46fe604ab1bd1753c48c1ecbc02e54b47c5771a33d94aad4f1d"

  url "https://github.com/acltabontabon/habi/releases/download/v#{version}/Habi_#{version}_universal.dmg"
  name "Habi"
  desc "Find which agent skills fit a repository, and install them after a preview"
  homepage "https://acltabontabon.com/habi/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Habi updates itself with updates signed by its own key; brew should not fight that.
  auto_updates true
  depends_on :macos

  app "Habi.app"

  # Habi's data folder (My skills, the journal) is left alone on purpose.
  zap trash: [
    "~/Library/Caches/com.acltabontabon.habi",
    "~/Library/Preferences/com.acltabontabon.habi.plist",
    "~/Library/Saved Application State/com.acltabontabon.habi.savedState",
    "~/Library/WebKit/com.acltabontabon.habi",
  ]

  caveats <<~EOS
    Habi is not signed or notarized by Apple, so macOS asks you to confirm the first launch:
    open Habi once, then System Settings > Privacy & Security > Open Anyway.
    Homebrew does not bypass that check. After that, Habi updates itself.
  EOS
end
