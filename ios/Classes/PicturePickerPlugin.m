#import "PicturePickerPlugin.h"
#import <PicturePicker.h>

@implementation PicturePickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"PicturePicker"
                                     binaryMessenger:[registrar messenger]];
    PicturePickerPlugin* instance = [[PicturePickerPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     
    if ([@"openSelect" isEqualToString:call.method]) {
         [PicturePicker openSelect:call.arguments];
        result( @"openSelect");
    } else if ([@"openCamera" isEqualToString:call.method]) {
          [PicturePicker openCamera:call.arguments];
            result( @"openCamera");
    } else if ([@"deleteCacheDirFile" isEqualToString:call.method]) {
          [PicturePicker deleteCacheDirFile];
    } else{
         result(FlutterMethodNotImplemented);
    }
}

@end

