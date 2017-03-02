Pod::Spec.new do |s|

  s.name         = "XCCountdownButton"
  s.version      = "1.0.1"
  s.summary      = "Dropdown"

  s.description  = "自定义下拉菜单封装"

  s.homepage     = "https://github.com/fanxiaocong/XCCountdownButton"

  s.license      = "MIT"


  s.author       = { "樊小聪" => "1016697223@qq.com" }


  s.source       = { :git => "https://github.com/fanxiaocong/XCCountdownButton.git", :tag => s.version }


  s.source_files  = "XCCountdownButton"
  s.requires_arc  = true
  s.platform     = :ios, "8.0"
  s.frameworks   =  'UIKit'

end
