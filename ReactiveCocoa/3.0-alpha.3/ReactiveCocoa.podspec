Pod::Spec.new do |s|
  s.name         = "ReactiveCocoa"
  s.version      = "3.0-alpha.3"
  s.summary      = "A framework for composing and transforming streams of values."
  s.description  = "ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values."
  s.homepage     = "https://github.com/ReactiveCocoa/ReactiveCocoa/"
  s.license      = "MIT"
  s.author       = { "Josh Abernathy" => "josh@github.com" }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.source       = { :git => "https://github.com/ReactiveCocoa/ReactiveCocoa.git", :tag => "v#{s.version}" }
  s.default_subspec = "UI"

  s.subspec "no-arc" do |ss|
    ss.source_files = "ReactiveCocoa/Objective-C/RACObjCRuntime.{h,m}"
    ss.requires_arc = false
    ss.framework  = "Foundation"
  end

  s.subspec "Core" do |ss|
    ss.dependency "ReactiveCocoa/no-arc"
    ss.source_files  = "ReactiveCocoa/**/*.{d,h,m,swift}"
    ss.private_header_files = "**/*Private.h", "**/*EXTRuntimeExtensions.h", "**/RACEmpty*.h"
    ss.exclude_files = "ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*"
    ss.header_dir = "ReactiveCocoa"
    ss.framework  = "Foundation"
  end

  s.subspec "UI" do |ss|
    ss.dependency "ReactiveCocoa/Core"
    ss.source_files = "ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*"
    ss.private_header_files = "**/*Private.h", "**/*EXTRuntimeExtensions.h", "**/RACEmpty*.h"
    ss.osx.exclude_files = "ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*.{d,h,m,swift}"
    ss.ios.exclude_files = "ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*.{d,h,m,swift}"
    ss.header_dir = "ReactiveCocoa"
    ss.frameworks = "Foundation", "UIKit"
  end

  s.dependency "LlamaKit"
end
