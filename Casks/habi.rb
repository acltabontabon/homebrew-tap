cask "habi" do
  version "0.3.0"
  sha256 "d8d11461313bdb8efd4330f63078f5051ee02dee993accfacebf6e4637fac373"

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
