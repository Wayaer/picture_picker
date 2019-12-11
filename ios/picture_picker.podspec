#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'picture_picker'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for Picture Picker.'
  s.description      = <<-DESC
A Flutter plugin for making the underlying platform (Android or iOS) .
                       DESC
  s.homepage         = 'https://github.com/Wayaer/picture_picker'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Flutter Team' => 'wayaer@foxmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end
