Pod::Spec.new do |s|
  s.name         = "Founq_KeychainIDFA"
  s.version      = "1.0.0"
  s.summary      = "Founq_KeychainIDFA. 获取idfa标示当设备唯一识别,并保存到keychain中.基本不变.除非刷机."
  s.homepage     = "https://github.com/ysghome"
  s.license      = 'MIT'
  s.author       = "ego.yin"
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.source       = { :git => "https://github.com/ysghome/Founq_KeychainIDFA.git", :tag => s.version.to_s }
  s.source_files  = 'Pod/Classes', 'Pod/Classes/**/*.{h,m}'
  s.library = 'Foundation'
  s.requires_arc = true
end
