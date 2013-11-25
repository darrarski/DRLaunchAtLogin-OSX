Pod::Spec.new do |s|
  s.name         = "DRLaunchAtLogin"
  s.version      = "0.1"
  s.summary      = "Utility for enabling app launch at login under OS X"
  s.homepage     = "http://bitbucket.org/darrarski/drlaunchatlogin-osx"
  s.license      = 'MIT'
  s.author       = { "Darrarski" => "darrarski@gmail.com" }
  s.source       = { :git => "http://bitbucket.org/darrarski/drlaunchatlogin-osx.git" }
  s.osx.source_files = 'DRLaunchAtLogin'
  s.requires_arc = true
end
