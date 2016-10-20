# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def mainPods
 pod 'RxSwift',    '3.0.0-rc.1'
 pod 'RxCocoa',    '3.0.0-rc.1'
end

def testingPods
 pod 'RxBlocking', '3.0.0-rc.1'
 pod 'RxTest',     '3.0.0-rc.1'
end 

target 'ViaflyProject' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ViaflyProject
	mainPods

  target 'ViaflyProjectTests' do
    inherit! :search_paths
    # Pods for testing
	testingPods
  end

  target 'ViaflyProjectUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
