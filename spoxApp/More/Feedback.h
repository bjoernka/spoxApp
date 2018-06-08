//
//  MoreDetail.h
//  spoxApp
//
//  Created by Björn Kaczmarek on 06.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface Feedback : UIViewController <MFMailComposeViewControllerDelegate>

@property NSString *cellTapped;

@end
