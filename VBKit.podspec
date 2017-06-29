#
#  Be sure to run `pod spec lint VBKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "VBKit"
  s.version      = "0.1.6"
  s.summary      = "VBKit is committed to rapid construction projects."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                   VBKit for base project.VBKit is committed to rapid construction projects.
                   DESC

  s.homepage     = "https://github.com/VisionBao/VBKit/"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "VisionBao" => "visionbao@163.com" }
  # Or just: s.author    = "VisionBao"
  # s.authors            = { "VisionBao" => "visionbao@163.com" }
  # s.social_media_url   = "http://twitter.com/VisionBao"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/VisionBao/VBKit.git", :tag => "#{s.version}" }
  # s.source       = { :git => "https://github.com/VisionBao/VBKit.git" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # s.source_files  = "VBKit/**/*.{h,m}"
  # s.source_files  = "VBKit/*"
  # s.exclude_files = "Demo/*"

  # s.public_header_files = "VBKit/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "VBKit/**/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "VBKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

    s.source_files = 'VBKit/VBKit.h'


  s.subspec 'VBConstants' do |ss|
    ss.source_files = 'VBKit/VBConstants.h'
  end

  s.subspec 'VBCategories' do |ss|
    ss.source_files = 'VBKit/VBCategories/**/*'
  end

  s.subspec 'VBFoundation' do |ss|
    ss.source_files = 'VBKit/VBFoundation/**/*'
    ss.dependency "CocoaLumberjack", "~> 3.0.0"
  end

  s.subspec 'VBManagers' do |ss|
     ss.source_files = 'VBKit/VBManagers/VBManagers.h'
   ss.subspec 'VBUMengAnalyticsManager' do |sss|
     sss.source_files = 'VBKit/VBManagers/VBUMengAnalyticsManager/**/*'
     sss.dependency "UMengAnalytics", "~> 4.2.4"
   end
   ss.subspec 'VBDBManager' do |sss|
     sss.source_files = 'VBKit/VBManagers/VBDBManager/**/*'
     sss.dependency "FMDB/SQLCipher", "~> 2.0.0"
     sss.library = 'sqlite3'
   end
   ss.subspec 'VBFileManager' do |sss|
     sss.source_files = 'VBKit/VBManagers/VBFileManager/**/*'
     sss.dependency "ZipArchive", "~> 1.4.0"
   end
   ss.subspec 'VBHTTPManager' do |sss|
     sss.source_files = 'VBKit/VBManagers/VBHTTPManager/**/*'
     sss.dependency "AFNetworking", "~> 3.0.0"
     sss.dependency "YYCache", "~> 1.0.0"
   end
   ss.subspec 'VBLocationManager' do |sss|
     sss.source_files = 'VBKit/VBManagers/VBLocationManager/**/*'
     sss.frameworks   = 'CoreLocation'
   end
 end

 s.subspec 'VBUI' do |ss|
     ss.source_files = 'VBKit/VBUI/VBUI.h'
   ss.subspec 'VBAlertView' do |sss|
     sss.source_files = 'VBKit/VBUI/VBAlertView/**/*.{h,m}'
     sss.resource  = 'VBKit/VBUI/VBAlertView/**/*.png'
     sss.dependency "WSProgressHUD", "~> 1.1.1"
   end
   ss.subspec 'Base' do |sss|
    sss.source_files = 'VBKit/VBUI/Base/**/*.{h,m}'
    sss.resource  = 'VBKit/VBUI/Base/**/*.png'
    sss.dependency "VBKit/VBConstants"
  end
end


end
