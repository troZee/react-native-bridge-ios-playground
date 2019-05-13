
#import "ReactViewController.h"

@implementation ReactViewController

@synthesize rootView = _rootView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _rootView = [[RCTRootView alloc] initWithBridge:[[AppDelegate shared] bridge] moduleName:@"RNHighScores" initialProperties:@{}];
    self.view = _rootView;
    _navigationModule = (RTCNavigationModule*)[[[AppDelegate shared] bridge] moduleForClass:RTCNavigationModule.class];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

-(void) pushReactNativeDetails {
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [_navigationModule pushDetailsView];
}

@end
