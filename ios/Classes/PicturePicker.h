#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "TZImagePickerController.h"
@interface PicturePicker : NSObject <TZImagePickerControllerDelegate>
+ (void)openSelect:(NSDictionary*)arguments viewController:(UIViewController*)viewController result:(FlutterResult *);
+ (void)openCamera:(NSDictionary*)arguments;
+ (void)deleteCacheDirFile;

@end
