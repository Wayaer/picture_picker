#import "PicturePickerPlugin.h"
#import <PicturePicker.h>

@implementation PicturePickerPlugin{
    UIViewController *_viewController;
    
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"PicturePicker"
                                     binaryMessenger:[registrar messenger]];
     UIViewController *viewController =
        [UIApplication sharedApplication].delegate.window.rootViewController;
    PicturePickerPlugin* instance = [[PicturePickerPlugin alloc] initWithViewController:viewController];
    [registrar addMethodCallDelegate:instance channel:channel];
}
- (instancetype)initWithViewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    _viewController = viewController;
  }
  return self;
}
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    if ([@"openSelect" isEqualToString:call.method]) {
        [PicturePicker openSelect:call.arguments viewController:_viewController result:result];
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

