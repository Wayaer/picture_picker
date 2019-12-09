#import "PicturePicker.h"
#import "TZImagePickerController/TZImagePickerController.h"
#import "TZImagePickerController/TZImageManager.h"
#import "TZImagePickerController/TZImageCropManager.h"

@implementation PicturePicker

+ (void)openSelect:(NSDictionary *)arguments{
    
    int maxSelectNum = [[arguments objectForKey:@"maxSelectNum"] intValue];
    int minSelectNum = [[arguments objectForKey:@"minSelectNum"] intValue];
    //    int imageSpanCount = [[arguments objectForKey:@"imageSpanCount"] intValue];
    int selectionMode = [[arguments objectForKey:@"selectionMode"] intValue];
    //    int minimumCompressSize = [[arguments objectForKey:@"minimumCompressSize"] intValue];
    int cropW = [[arguments objectForKey:@"cropW"] intValue];
    int cropH = [[arguments objectForKey:@"cropH"] intValue];
    //    int cropCompressQuality = [[arguments objectForKey:@"cropCompressQuality"] intValue];
    //    int videoQuality = [[arguments objectForKey:@"videoQuality"] intValue];
    int videoMaxSecond = [[arguments objectForKey:@"videoMaxSecond"] intValue];
    //    int videoMinSecond = [[arguments objectForKey:@"videoMinSecond"] intValue];
    //    int recordVideoSecond = [[arguments objectForKey:@"recordVideoSecond"] intValue];
    int selectValueType = [[arguments objectForKey:@"selectValueType"] intValue];
    int circleCropRadius = [[arguments objectForKey:@"circleCropRadius"] intValue];
    BOOL previewImage = [[arguments objectForKey:@"previewImage"] boolValue];
    //    BOOL previewVideo = [[arguments objectForKey:@"previewVideo"] boolValue];
    //    BOOL isZoomAnim = [[arguments objectForKey:@"isZoomAnim"] boolValue];
    BOOL isCamera = [[arguments objectForKey:@"isCamera"] boolValue];
    BOOL enableCrop = [[arguments objectForKey:@"enableCrop"] boolValue];
    //    BOOL compress = [[arguments objectForKey:@"compress"] boolValue];
    //    BOOL hideBottomControls = [[arguments objectForKey:@"hideBottomControls"] boolValue];
    //    BOOL freeStyleCropEnabled = [[arguments objectForKey:@"freeStyleCropEnabled"] boolValue];
    BOOL showCropCircle = [[arguments objectForKey:@"showCropCircle"] boolValue];
    //    BOOL showCropFrame = [[arguments objectForKey:@"showCropFrame"] boolValue];
    //    BOOL showCropGrid = [[arguments objectForKey:@"showCropGrid"] boolValue];
    //    BOOL openClickSound = [[arguments objectForKey:@"openClickSound"] boolValue];
    BOOL isGif = [[arguments objectForKey:@"isGif"] boolValue];
    BOOL scaleAspectFillCrop = [[arguments objectForKey:@"scaleAspectFillCrop"] boolValue];
    BOOL originalPhoto = [[arguments objectForKey:@"originalPhoto"] boolValue];
    
    TZImagePickerController *picker = [[TZImagePickerController alloc] initWithMaxImagesCount:maxSelectNum delegate:nil];
    picker.maxImagesCount=maxSelectNum;
    picker.minImagesCount=minSelectNum;
    picker.allowPickingGif=isGif;
    picker.allowCrop=enableCrop;
    if(selectValueType==1){
        picker.allowPickingImage=true;
        picker.allowTakePicture=isCamera;
        picker.allowPickingVideo=false;
        picker.allowTakeVideo=false;
    }else if(selectValueType==2){
        picker.allowPickingVideo=true;
        picker.allowTakeVideo=isCamera;
        picker.allowPickingImage=false;
        picker.allowTakePicture=false;
    }else{
        picker.allowPickingImage=true;
        picker.allowPickingVideo=true;
        picker.allowTakePicture=isCamera;
        picker.allowTakeVideo=isCamera;
        
    }
    if (isCamera&&picker.allowTakeVideo) {
        picker.videoMaximumDuration=videoMaxSecond;
    }
    picker.allowPreview=previewImage;
    picker.allowPickingOriginalPhoto=originalPhoto;
    picker.showPhotoCannotSelectLayer=true;
  
    if (selectionMode == 1) {  // 单选模式
        picker.showSelectBtn = NO;
        picker.allowCrop=enableCrop;
        if(enableCrop){
            picker.scaleAspectFillCrop=scaleAspectFillCrop;//是否图片等比缩放填充cropRect区域
            if(showCropCircle) {
                picker.needCircleCrop = showCropCircle; //圆形裁剪
                picker.circleCropRadius = circleCropRadius; //圆形半径
            } else {
                CGFloat x = ([[UIScreen mainScreen] bounds].size.width - cropW) / 2;
                CGFloat y = ([[UIScreen mainScreen] bounds].size.height - cropH) / 2;
                picker.cropRect = CGRectMake(x,y,cropW,cropH);
            }
        }
    }
    [picker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
      NSLog(@"LogInfo%@",assets);
    }];
//    [self presentViewController:picker animated:YES completion:nil];
}
+ (void)openCamera:(NSDictionary *)arguments{
    NSLog(@"LogInfo%@",arguments);
    
}
+ (void)deleteCacheDirFile{
    
    
    
}
@end

