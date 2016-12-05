Pod::Spec.new do |s|

  s.name         = "PopEvent"
  s.version      = "0.1.0"
  s.summary      = "An elegant way to handling pop gesture recogenizer event."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/talisk/PopEvent"
  s.screenshots  = "https://github.com/talisk/PopEvent/blob/master/Screenshots/p01.gif", "https://github.com/talisk/PopEvent/blob/master/Screenshots/p02.gif"


  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "talisk" => "talisk@talisk.cn" }
  s.social_media_url   = "http://weibo.com/u/1574201213"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/talisk/PopEvent.git", :tag => "0.1.0" }

  s.source_files  = "PopEvent", "PopEvent/*.{h,m}"

  s.requires_arc = true

end
