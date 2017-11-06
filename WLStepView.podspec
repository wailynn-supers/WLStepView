Pod::Spec.new do |s|
  s.name             = 'WLStepView'
  s.version          = '0.1.0'
  s.summary          = 'A horizontal step view'
  s.description      = <<-DESC
A horizntal step view for showing steps or routes with customizable properties.
                       DESC

  s.homepage         = 'https://github.com/wailynn-wlz/WLStepView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wai Lynn Zaw' => 'wailynnzaw@owaytrip.com' }
  s.source           = { :git => 'https://github.com/wailynn-wlz/WLStepView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wailynnzaw'
  s.ios.deployment_target = '8.0'
  s.source_files = 'WLStepView/Classes/**/*'
end
