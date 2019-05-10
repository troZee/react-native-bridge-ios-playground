
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTLog.h>

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
NS_ASSUME_NONNULL_BEGIN

@interface EmailModule : RCTEventEmitter <RCTBridgeModule, MFMailComposeViewControllerDelegate>

- (void)sendEmailUsingMFMailComposeViewController:(NSString*) to subject:(NSString*)subject with:(NSString*) body ;

@end

NS_ASSUME_NONNULL_END
