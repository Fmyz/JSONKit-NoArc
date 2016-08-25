#cocoa pods pesc文件创建
#pod spec create FWeiXinSDK(文件名)
#打开方式 选Xcode

#s.source_files指向循环滚动的核心代码放在项目的FWeiXinSDK/SDKExport/*.{h,m}

#s.libraries  表示这个pod依赖的 苹果官方的库，也就是类似libstdc++.a ,libsqlite.a 等等的a文件
#s.vendored_libraries 就表示用户自己的a文件，比如新浪微博SDK的libWeiboSDK.a

#s.frameworks 表示pod依赖的 苹果的framework， 比如 UIKit，SystemConfiguration等等
#s.vendored_frameworks， 表示pod依赖的自己的framework，比如qqSDK的TencentOpenAPI.framework

#s.xcconfig = {
#"LIBRARY_SEARCH_PATHS" => "$(PODS_ROOT)/CAUmengSocial/Umeng_SDK_Social_iOS_ARM64_5.1/UMSocial_Sdk_5.1/**
#                           $(PODS_ROOT)/CAUmengSocial/Umeng_SDK_Social_iOS_ARM64_5.1/UMSocial_Sdk_Extra_Frameworks/TencentOpenAPI/",
#"FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/CAUmengSocial/Umeng_SDK_Social_iOS_ARM64_5.1/UMSocial_Sdk_Extra_Frameworks/TencentOpenAPI/ $(PODS_ROOT)/CAUmengSocial/Umeng_SDK_Social_iOS_ARM64_5.1/UMSocial_Sdk_Extra_Frameworks/Facebook/ $(PODS_ROOT)/CAUmengSocial/Umeng_SDK_Social_iOS_ARM64_5.1/UMSocial_Sdk_Extra_Frameworks/Twitter/"
#}

#

#s.dependency 'JSONKit', '~> 1.4' 依赖的第三方库
#s.dependency 'XXXX', '~> XX' 依赖的第三方库,有几个写几个

#Pod 验证
#pod lib lint
#如果有报错,会明确指出哪个地方出错,按提示信息修改

#提交代码到github
#git add .
#git commit -m "version 0.0.1"
#git push origin master

#打上标签
##git tag -a 0.0.1 -m "tag release 0.0.1"
##git push --tags

#第一次提交到Cocoapods官方的Specs仓库中
#Trunk的Register
#如果第一次使用的话那么就需要注册了,需要cocoapods 0.33版本以上才支持
#pod trunk register *youremail*@gmail.com '*yourname*' --description='iMac' --verbose
#以上命令是注册所需的,替换你的邮箱,用户名,以及描述内容, --verbose可以输入详细的debug
#完成后需要去邮箱验证一下能继续往下操作

#注册成功以后,可以使用
#pod trunk me
#查看注册信息,以及发布过得的Pods

#提交{project}.podspec 需要在该文件路径下执行 如有警告需要 在后面加--allow-warnings
#pod trunk push CLRollingCycleView.podspec --allow-warnings
#这条命令做了如下三件事:
#验证本地的podspec文件,也可以使用 pod lib lint验证
#上传podspec文件到trunk服务
#将{project}.podspec文件转为{poject}.podspec.json文件
#如果没有报错的话,那么基本就妥了

#终端执行 pod search 就可以找到了,如果没有找到 pod setup再试一下


Pod::Spec.new do |s|
  s.name         = "JSONKit-NoArc"
  s.version      = "0.0.1"

  s.summary      = "JSONKit v1.4 设置fno-objc-arc"
  s.homepage     = "https://github.com/johnezang/JSONKit"
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
        Copyright (c) 2016 Tencent. All rights reserved.
        LICENSE
}
  s.author       = { "Fmyz" => "https://github.com/johnezang/JSONKit.git" }

  s.platform     = :ios
  s.source       = { :git => "https://github.com/Fmyz/JSONKit-NoArc.git", :tag => "#{s.version}" }
  s.source_files = 'JSONKit.*'
  s.requires_arc = false
end
