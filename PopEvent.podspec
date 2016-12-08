Pod::Spec.new do |s|

  s.name         = "PopEvent"
  s.version      = "0.2.0"
  s.summary      = "An elegant way to handling pop gesture recogenizer event."

  s.description  = "An elegant way to handling pop gesture recogenizer event. Have you ever had such a problem? The screen-edge-pan gesture recognizer is invalid when you custom the `leftNavigationItem`. When you want to make user confirm whether to popToSuperViewController or not, you should prevent the pop and present a `UIAlertController'. Now you can implement them with a little bit of code."

  s.homepage     = "https://github.com/talisk/PopEvent"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "talisk" => "talisk@talisk.cn" }
  s.social_media_url   = "http://weibo.com/u/1574201213"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/talisk/PopEvent.git", :tag => "0.1.0" }

  s.source_files  = "PopEvent", "PopEvent/*.{h,m}"

  s.requires_arc = true

end
