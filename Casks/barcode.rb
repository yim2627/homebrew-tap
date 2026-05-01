cask "barcode" do
  version "0.1.0"
  sha256 "7fc8f897d2a831f666376ede7b9ff5ec12b8f4acc4e6bafa7ed480281d0f417a"

  url "https://github.com/yim2627/BarCode/releases/download/v#{version}/BarCode.dmg"
  name "BarCode"
  desc "Minimal macOS menu bar TOTP (2FA) app"
  homepage "https://github.com/yim2627/BarCode"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BarCode.app"

  zap trash: [
    "~/Library/Preferences/com.jiseong.BarCode.plist",
  ]
end
