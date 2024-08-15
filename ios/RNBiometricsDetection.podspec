Pod::Spec.new do |s|
  s.name         = 'RNBiometricsDetection'
  s.version      = '1.0.0'
  s.summary      = 'A React Native module for biometrics detection.'
  s.description  = <<-DESC
                   A React Native module for biometrics detection.
                   DESC
  s.homepage     = 'https://github.com/mergograiqevci/react-native-biometrics-changed'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Mergim Graiqevci' => 'mergograiqevci@gmail.com' }
  s.source       = { :git => 'https://github.com/mergograiqevci/react-native-biometrics-changed.git', :tag => s.version.to_s }
  s.source_files  = 'ios/**/*.{h,m,swift}'
  s.requires_arc = true
  s.dependency 'React'
  s.ios.deployment_target = '10.0'
end
