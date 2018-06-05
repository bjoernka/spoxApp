//
//  NewsTable.h
//  spoxApp
//
//  Created by Björn Kaczmarek on 03.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 In the News-Section all news get filtered by their category
 */

@interface NewsTable : UITableViewController

@property (strong, nonatomic) NSArray *images;

@end
