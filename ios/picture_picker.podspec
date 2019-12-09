
Pod::Spec.new do |s|
  s.name             = 'picture_picker'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin about Picture Picker.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'https://github.com/Wayaer/picture_picker'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Wayaer' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '10.0'
end

