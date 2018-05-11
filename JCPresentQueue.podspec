Pod::Spec.new do |s|
  s.name         = "JCPresentQueue"
  s.version      = "1.1.2"
  s.summary      = "automatic manages the queue of presented controllers"
  s.homepage     = "https://github.com/HJaycee/JCPresentQueue"
  s.license      = "MIT"
  s.author       = { "HJaycee" => "huangxisu@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/HJaycee/JCPresentQueue.git", :tag => s.version }
  s.source_files  = "JCPresentQueueDemo/JCPresentQueueDemo/JCPresentQueue/*.{h,m}"
  s.requires_arc = true
end
