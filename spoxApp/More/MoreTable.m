//
//  MoreTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 06.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "MoreTable.h"
#import "Feedback.h"
#import "Imprint.h"
#import "Settings.h"

@interface MoreTable ()

@property NSArray *moreOptions;

@end

@implementation MoreTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moreOptions = @[@"Settings",@"Imprint",@"Feedback"];
    
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
    return self.moreOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.moreOptions[indexPath.row];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // First cell selected
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Settings *settingsVC = (Settings *)[storyboard instantiateViewControllerWithIdentifier:@"settingsVC"];
        settingsVC.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        [self.navigationController pushViewController:settingsVC animated:YES];
    } else if (indexPath.row == 1) {
        // Second cell selected
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Imprint *imprintVC = (Imprint *)[storyboard instantiateViewControllerWithIdentifier:@"imprintVC"];
        imprintVC.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        [self.navigationController pushViewController:imprintVC animated:YES];
    } else if (indexPath.row == 2) {
        // Third cell selected
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Feedback *feedbackVC = (Feedback *)[storyboard instantiateViewControllerWithIdentifier:@"feedbackVC"];
        feedbackVC.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        feedbackVC.cellTapped = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        [self.navigationController pushViewController:feedbackVC animated:YES];
    } else {
        
    }
}
@end
