//
//  MoreTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 06.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "MoreTable.h"
#import "MoreDetail.h"

@interface MoreTable ()

@property NSArray *moreOptions;

@end

@implementation MoreTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _moreOptions = @[@"Settings",@"Imprint",@"Feedback"];
    
    // delete unnecessary lines under tableView
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moreOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell" forIndexPath:indexPath];
    
    cell.textLabel.text = _moreOptions[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get the screenspace between Navigationbar and tabbar
    CGFloat tableViewHeight = tableView.bounds.size.height;
    CGFloat tabbarHeight = self.tabBarController.tabBar.bounds.size.height;
    CGFloat navbarHeight = self.navigationController.navigationBar.bounds.size.height;
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat usableScreenHeight = tableViewHeight - tabbarHeight - navbarHeight - statusBarHeight;
    
    return (usableScreenHeight / 7);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier  isEqual: @"moreDetail"]) {
        // UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        // UITableViewController *controller = navController.topViewController;
        // NewsSortedTable *destVC = (NewsSortedTable *)segue.destinationViewController;
        
        MoreDetail *destVC = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSLog(@"Value of indexPathRow = %lu", indexPath.row);
        destVC.title = cell.textLabel.text;
        destVC.cellTapped = cell.textLabel.text;
    }
}

@end
