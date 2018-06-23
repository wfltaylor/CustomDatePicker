#
# Be sure to run `pod lib lint CustomDatePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WTCustomDatePicker'
  s.version          = '1.0.1'
  s.summary          = 'A custom date picker similar to UIDatePicker with more customisation options.'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A custom date picker similar to UIDatePicker with more customisation options. It is mostly code compatible with the standard UIDatePicker.
                       DESC

  s.homepage         = 'https://github.com/wfltaylor/CustomDatePicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wfltaylor@gmail.com' => 'wfltaylor@gmail.com' }
  s.source           = { :git => 'https://github.com/wfltaylor/CustomDatePicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'CustomDatePicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CustomDatePicker' => ['CustomDatePicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
