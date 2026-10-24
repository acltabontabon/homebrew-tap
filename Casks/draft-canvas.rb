cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.16.0"
  sha256 arm:   "a366eff4fe7447b7b08078b53c4ea0669a71a1977d1e0ab3057ab3c3ea6b606f",
         intel: "0653b39accbbdde1abe75b5f8fa79e3883f524c98a50cb1276cc0ffc24c60c54"

  url "https://github.com/acltabontabon/draft-canvas/releases/download/v#{version}/Draft-Canvas_#{version}_macOS_#{arch}.dmg"
  name "Draft Canvas"
  desc "Draw software architecture and explain how it works"
  homepage "https://draftcanvas.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Draft Canvas.app"

  caveats <<~EOS
    For builds without Apple signing and notarization, open Draft Canvas once, then
    System Settings > Privacy & Security > Open Anyway if prompted.
    Homebrew preserves Gatekeeper checks. Draft Canvas updates itself with signed updates.
    Uninstalling this cask leaves your diagrams, Quick Drafts and recovery data alone.
  EOS
end
