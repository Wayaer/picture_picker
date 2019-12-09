#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
@interface PicturePicker : NSObject
+ (void)openSelect:(NSDictionary*)arguments;
+ (void)openCamera:(NSDictionary*)arguments;
+ (void)deleteCacheDirFile;

@end
