
#import "ReactViewController.h"
#import <React/RCTRootView.h>
#import "AppDelegate.h"

@interface ReactViewController ()

@end

@implementation ReactViewController

@synthesize rootView = _rootView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _rootView = [[RCTRootView alloc] initWithBridge:[[AppDelegate shared] bridge] moduleName:@"App" initialProperties:@{}];
    self.view = _rootView;
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
