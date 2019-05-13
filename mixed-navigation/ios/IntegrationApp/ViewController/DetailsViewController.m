
#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *passValueLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self passValueLabel]setText:[self passArg]];
    [[self navigationController]setNavigationBarHidden:!_shouldShowNavigationController animated:YES];
    
}

@end
