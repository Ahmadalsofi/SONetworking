#
# Be sure to run `pod lib lint SONetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SONetworking'
  s.version          = '1.0.1'
  s.summary          = 'A simple convenient wrapper that makes HTTPS request and read the response and decode it into a model'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple convenient wrapper that makes HTTPS request and read the response and decode it into a model.
                       DESC

  s.homepage         = 'https://github.com/alsofiahmad@yahoo.com/SONetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alsofiahmad@yahoo.com' => 'alsofiahmad@yahoo.com' }
  s.source           = { :git => 'https://github.com/alsofiahmad@yahoo.com/SONetworking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ahmadalsofii'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SONetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SONetworking' => ['SONetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = ''
  # s.dependency ''
end
