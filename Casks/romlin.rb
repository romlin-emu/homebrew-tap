cask "romlin" do
  version "0.20.0"
  # Replace with the first Romlin release checksum before enabling this cask.
  sha256 :no_check
  disable! date: "2026-11-02", because: "a verified Romlin release is not available yet"

  url "https://github.com/romlin-emu/romlin/releases/download/v#{version}/Romlin-#{version}-macos-arm64.zip"
  name "Romlin"
  desc "Play the games in your RomM library"
  homepage "https://github.com/romlin-emu/romlin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Romlin.app"

  zap trash: "~/Library/Application Support/Romlin"
end
