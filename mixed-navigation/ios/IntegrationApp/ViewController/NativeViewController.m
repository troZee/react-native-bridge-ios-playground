
#import "NativeViewController.h"


@interface NativeViewController ()

@end

@implementation NativeViewController

- (IBAction)pushInReactNative:(id)sender {
    ReactViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ReactViewController"];
    [[self navigationController]pushViewController:vc animated:true];
    vc.shouldShowDetails = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _navigationModule = (RTCNavigationModule*)[[[AppDelegate shared] bridge] moduleForClass:RTCNavigationModule.class];
    
}
- (IBAction)openDetails:(UIButton *)sender {
    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    vc.shouldShowNavigationController = YES;
    vc.passArg = @"NativeViewController";
    [[self navigationController]pushViewController:vc animated:true];
    
}


@end
