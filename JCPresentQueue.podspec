Pod::Spec.new do |s|
  s.name         = "JCPresentQueue"
  s.version      = "1.0.0"
  s.summary      = "A category for present controllers with FIFO or LIFO"
  s.homepage     = "https://github.com/HJaycee/JCPresentQueue"
  s.license      = "MIT"
  s.author       = { "HJaycee" => "huangxisu@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/HJaycee/JCPresentQueue.git", :tag => s.version }
  s.source_files  = "UIViewController+JCPresentQueue.h,UIViewController+JCPresentQueue.m"
  s.requires_arc = true
end
