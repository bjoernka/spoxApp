//
//  MoreDetail.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 06.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "MoreDetail.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MoreDetail ()
@property (weak, nonatomic) IBOutlet UILabel *eMailLabel;

@end

@implementation MoreDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.cellTapped  isEqual: @"Feedback"]) {
        if([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
            mailCont.mailComposeDelegate = self;
            
            [mailCont setSubject:@"Feedback App"];
            [mailCont setToRecipients:[NSArray arrayWithObject:@"bjoern.kaczmarek@gmail.com"]];
            [mailCont setMessageBody:@"This is a placeholder text." isHTML:NO];
            
            [self presentViewController:mailCont animated:YES completion:nil];
        } else {
            NSLog(@"Mail couldn't be send.");
        }

    } else {
        NSLog(@"self.cellTapped not transferred.");
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (result == MFMailComposeResultCancelled) {
        // Cancel - Delete Draft pressed
        _eMailLabel.text = @"E-Mail was not send.";
        NSLog(@"Canceled!");
    } else if (result == MFMailComposeResultSaved) {
        // Cancel - Save Draft pressed
        _eMailLabel.text = @"E-Mail was saved.";
    }else if (result == MFMailComposeResultSent) {
        // Send pressed
        _eMailLabel.text = @"E-Mail was send.";
    } else if (result == MFMailComposeResultFailed) {
        // Send pressed but sending failed
        _eMailLabel.text = @"Sending E-Mail failed.";
    }
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
