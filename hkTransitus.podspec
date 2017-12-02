Pod::Spec.new do |s|
  s.name             = 'hkTransitus'
  s.version          = '1.0.4'
  s.summary          = 'It is a side menu transition like LinkedIn style.'
 
  s.description      = <<-DESC
It is a side menu transition component. More information about on readme.md.
                       DESC
 
  s.homepage         = 'https://github.com/heuristisk/hkTransitus.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anderson Santos Gusmão' => 'heuristisking@gmail.com' }
  s.source           = { :git => 'https://github.com/heuristisk/hkTransitus.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'hkTransitus/*'
 
end

