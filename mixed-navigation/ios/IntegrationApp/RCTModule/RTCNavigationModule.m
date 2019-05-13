
#import "RTCNavigationModule.h"

@interface RTCNavigationModule ()

@end

@implementation RTCNavigationModule

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"pushDetailsView"];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(pushDetailsViewController:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    [self pushViewController:@"DetailsViewController" resolve:resolve rejecter:reject];
}

-(void) pushViewController:(NSString *)name resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {

    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if (!root) {
        reject(@"navigation", @"root is nil", [[NSError alloc]initWithDomain:@"navigation" code:999 userInfo:[NSDictionary dictionary]]);
        return;
    }
    if (![[root childViewControllers] lastObject]) {
        reject(@"navigation", @"childViewControllers.lastObject is nil", [[NSError alloc]initWithDomain:@"navigation" code:999 userInfo:[NSDictionary dictionary]]);
        return;
    }

    DetailsViewController *vc = [root.storyboard instantiateViewControllerWithIdentifier:name];
    vc.passArg = @"Native Details View Controller from react";
    vc.shouldShowNavigationController = YES;
    [[[[root childViewControllers] lastObject] navigationController]pushViewController:vc animated:true];
    [[[[root childViewControllers] lastObject] navigationController]setNavigationBarHidden:NO animated:YES];
    resolve(nil);
}

- (void) pushDetailsView {
    [self sendEventWithName:@"pushDetailsView" body:@{}];
}

@end
