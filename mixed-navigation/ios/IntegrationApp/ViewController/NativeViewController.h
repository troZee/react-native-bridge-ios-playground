
#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>
#import "DetailsViewController.h"
#import "ReactViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NativeViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (nonatomic) RTCNavigationModule *navigationModule;
@end

NS_ASSUME_NONNULL_END
