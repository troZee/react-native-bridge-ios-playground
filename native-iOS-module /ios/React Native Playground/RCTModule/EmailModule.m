
#import "EmailModule.h"

@interface EmailModule ()

@end

@implementation EmailModule

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(sendMail:(NSString *)to title:(NSString *)title body:(NSString *)body)
{
    [self sendEmailUsingMFMailComposeViewController:to subject:title with:body];
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"onResultSent",@"onResultSaved",@"onResultCancelled",@"onResultFailed", @"onUnknowError", @"onError"];
}

- (void)sendEmailUsingMFMailComposeViewController:(NSString*) to subject:(NSString*)subject with:(NSString*) body {
    if ([MFMailComposeViewController canSendMail]) {
        NSArray *recipients = @[to];
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setToRecipients:recipients];
        [mailViewController setSubject:subject];
        [mailViewController setMessageBody:body isHTML:NO];
        UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        [root presentViewController:mailViewController animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error){
        NSLog(@"%@", [error localizedDescription]);
        [self sendEventWithName:@"onError" body:@{@"description": [error localizedDescription]}];
        return;
    }
    NSString *eventNameForResult = @"";
    switch (result) {
        case MFMailComposeResultSent:
            eventNameForResult = @"onResultSent";
            NSLog(@"MFMailComposeResultSent");
            break;
        case MFMailComposeResultSaved:
            eventNameForResult = @"onResultSaved";
            NSLog(@"MFMailComposeResultSaved");
            break;
        case MFMailComposeResultCancelled:
            eventNameForResult = @"onResultCancelled";
            NSLog(@"MFMailComposeResultCancelled");
            break;
        case MFMailComposeResultFailed:
            eventNameForResult = @"onResultFailed";
            NSLog(@"MFMailComposeResultFailed");
            break;
        default:
            eventNameForResult = @"onUnknowError";
            NSLog(@"default");
            break;
    }
    
    [self sendEventWithName:eventNameForResult body:nil];
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [root dismissViewControllerAnimated:true completion:nil];
}

@end
