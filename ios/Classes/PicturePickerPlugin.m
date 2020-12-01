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
    if ([@"openImagePicker" isEqualToString:call.method]) {
        [PicturePicker openImagePicker:call :_viewController :result];
    } else if ([@"deleteCacheDirFile" isEqualToString:call.method]) {
        [PicturePicker deleteCacheDirFile:result];
    } else{
        result(FlutterMethodNotImplemented);
    }
}

@end

