
#import <UIKit/UIKit.h>
#import <React/RCTRootView.h>
#import "AppDelegate.h"
#import "RTCNavigationModule.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReactViewController : UIViewController

-(void) pushReactNativeDetails;

@property RCTRootView *rootView;
@property RTCNavigationModule *navigationModule;
@property (assign) BOOL shouldShowDetails;
@end

NS_ASSUME_NONNULL_END
