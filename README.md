# picture_picker

##此插件已全部迁移至[flutter_curiosity](https://github.com/Wayaer/flutter_curiosity),后期不再维护更新此插件,请使用 flutter_curiosity

#### ios
##### 1、添加相册相关权限：

- 项目目录->Info.plist->增加

```
   <key>NSCameraUsageDescription</key>    
    <string>请允许打开相机拍照</string>
    <key>NSLocationWhenInUseUsageDescription</key>
	<string>我们需要通过您的地理位置信息获取您周边的相关数据</string>
	<key>NSPhotoLibraryAddUsageDescription</key>
	<string>请允许访问相册以选取照片</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>请允许访问相册以选取照片</string>
	<key>NSFileProviderDomainUsageDescription</key>
	<string>是否允许此App使用你的相机进行拍照？</string>
```

##### 2、中文适配：    
- 添加中文 Runner -> Info.plist -> Localizations 点击"+"按钮，选择Chinese(Simplified)