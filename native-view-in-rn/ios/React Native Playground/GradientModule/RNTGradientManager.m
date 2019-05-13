
#import "RNTGradientManager.h"

@interface RNTGradientManager ()

@end

@implementation RNTGradientManager

RCT_EXPORT_MODULE(RNTGradient)

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (UIView *)view {
    return [[RNTGradientView alloc] init];
}

@end
