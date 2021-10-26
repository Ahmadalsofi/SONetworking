
Pod::Spec.new do |s|

  s.name             = 'SONetworking'
  s.version          = '1.0.1'
  s.summary          = 'A simple convenient wrapper that makes HTTPS request and read the response and decode it into a model'
  s.swift_version = '4.2'

  s.description      = 'A simple convenient wrapper that makes HTTPS request and read the response and decode it into a model.'

  s.homepage         = 'https://github.com/Ahmadalsofi/SONetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alsofiahmad@yahoo.com' => 'alsofiahmad@yahoo.com' }
  s.source           = { :git => 'https://github.com/Ahmadalsofi/SONetworking.git', :tag =>  s.version.to_s }


  s.ios.deployment_target = '9.3'
  s.source_files = 'SONetworking/Classes/**/*'
  
end
