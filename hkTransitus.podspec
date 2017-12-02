Pod::Spec.new do |s|
  s.name             = 'hkTransitus'
  s.version          = '1.0.0'
  s.summary          = 'It is a side menu transition like LinkedIn style.'
 
  s.description      = <<-DESC
It is a side menu transition like LinkedIn style
                       DESC
 
  s.homepage         = 'https://github.com/heuristisk/hkTransitus'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anderson Santos Gusmão' => 'heuristisking@gmail.com' }
  s.source           = { :git => 'https://github.com/heuristisk/hkTransitus', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'hkTransitus/*'
 
end

