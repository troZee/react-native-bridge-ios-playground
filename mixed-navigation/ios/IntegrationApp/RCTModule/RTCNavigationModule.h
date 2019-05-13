
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RTCNavigationModule : RCTEventEmitter <RCTBridgeModule>

- (void) pushViewController:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject;
- (void) pushDetailsView;
@end

NS_ASSUME_NONNULL_END
