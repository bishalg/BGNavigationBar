#
#  Be sure to run `pod spec lint BGNavigationBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/

Pod::Spec.new do |s|
  s.name         = "BGNavigationBar"
  s.version      = "0.0.1"
  s.summary      = "BGNavigationBar Custom Transparent iOS7 style Navigation Bar for iOS5"

  s.description  = <<-DESC
                    BGNavigationBar in Replacement for older iOS SDK for new iOS7 style Navigation Bar

                   * Custom Navigation Bar
                   * Transparent View
                   * Old SDK iOS5 support with iOS7 style view

  s.homepage     = "https://github.com/bishalg/BGNavigationBar"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"


  s.license      = 'MIT'
  # s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }


  s.author             = { "Bishal Ghimire" => "bishal.ghimire@gmail.com" }
  # s.authors          = { "Bishal Ghimire" => "bishal.ghimire@gmail.com", "other author" => "email@address.com" }
  s.social_media_url = "http://twitter.com/bishal_ghimire"

  s.platform     = :ios
  s.platform     = :ios, '5.0'

  s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'


  s.source       = { :git => "https://github.com/bishalg/BGNavigationBar.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'

  # s.public_header_files = 'Classes/**/*.h'


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
