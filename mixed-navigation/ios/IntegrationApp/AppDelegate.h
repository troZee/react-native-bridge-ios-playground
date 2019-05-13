
#import <UIKit/UIKit.h>
#import <React/RCTBridge.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,RCTBridgeDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RCTBridge *bridge;
+ (AppDelegate *)shared;
@end

