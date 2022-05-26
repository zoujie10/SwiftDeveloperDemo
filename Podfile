source 'https://github.com/CocoaPods/Specs.git'
target 'iOSDeveloperDemo' do
	platform :ios, '13.0'
	pod 'SnapKit'
	pod 'Alamofire'
  pod 'Charts'
  pod 'AlamofireObjectMapper'
  pod 'ObjectMapper'
  pod 'Moya'
  pod 'Then'
  pod 'Kingfisher'
  pod 'MJRefresh'
  pod 'MBProgressHUD'
  pod 'HMSegmentedControl'
  pod 'JXSegmentedView'
  pod 'SDWebImage'
  pod 'SDCycleScrollView'
  pod 'TZImagePickerController'
  # 配合SDCycleScrollView
  #	pod 'RealmSwift'
  # pod 'SwiftyJSON'
	use_frameworks!
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Needed for building for simulator on M1 Macs
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end
