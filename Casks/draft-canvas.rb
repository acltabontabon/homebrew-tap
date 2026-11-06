cask "draft-canvas" do
  arch arm: "arm64", intel: "x64"

  version "1.18.1"
  sha256 arm:   "6ad48f9156003df0bfd72db5d8cae2c8079204d9ed94e73afadd6141e95d483b",
         intel: "c2bd8cc81ec7b8784dadaf8effb6b71394a150460cd9d395d5b230f36b1aca4e"

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
