cask "todesk-keg" do
  version "4.7.6.4"
  sha256 "2810b1b7b9926fb85caefc4eae12aa833b2acbcd0e34fa3d9724323678ce15fc"

  url "https://dl.todesk.com/macos/ToDesk_#{version}.pkg",
      user_agent: :fake,
      referer:    "https://www.todesk.com/"
  name "ToDesk"
  desc "Remote control software"
  homepage "https://www.todesk.com/"

  auto_updates true

  pkg "ToDesk_#{version}.pkg"

  uninstall launchctl: [
              "com.youqu.todesk.client.startup",
              "com.youqu.todesk.desktop",
              "com.youqu.todesk.service",
              "com.youqu.todesk.startup",
            ],
            quit:      "com.youqu.todesk.mac",
            pkgutil:   "com.youqu.todesk.mac",
            delete:    "/Applications/ToDesk.app"

  zap trash: [
    "~/Library/Application Scripts/com.youqu.todesk.mac.LaunchHelper",
    "~/Library/Containers/com.youqu.todesk.mac.LaunchHelper",
    "~/Library/Group Containers/group.youqu.todesk",
    "~/Library/Preferences/com.youqu.todesk.mac.plist",
    "~/Library/Saved Application State/com.youqu.todesk.mac.savedState",
    "~/Library/ToDesk",
  ]
end
