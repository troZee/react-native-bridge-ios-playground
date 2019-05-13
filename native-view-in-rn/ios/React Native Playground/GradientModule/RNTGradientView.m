
#import "RNTGradientView.h"

@implementation RNTGradientView

- (void)layoutSubviews {
    [super layoutSubviews];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)[UIColor whiteColor].CGColor, (id)[UIColor blackColor].CGColor];
    [self.layer insertSublayer:gradient atIndex:0];
}

@end
