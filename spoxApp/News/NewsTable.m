//
//  NewsTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 03.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "NewsTable.h"
#import "NewsData.h"
#import "NewsSortedTable.h"

@interface NewsTable ()

@property (strong, nonatomic) NewsData *newsData;

@end

@implementation NewsTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // delete unnecessary lines under tableView
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // For demonstration purposes the data is added statically
    self.newsData = [[NewsData alloc] init];
    self.newsData.category = @[@"examCat1", @"examCat2", @"examCat3", @"examCat4", @"examCat5"];
    self.newsData.images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
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
    return self.newsData.images.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsTableCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"cell";
    cell.imageView.image = [UIImage imageNamed:self.newsData.images[indexPath.row]];
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
    
    return (usableScreenHeight / 6);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"newsDetail"]) {
        // UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        // UITableViewController *controller = navController.topViewController;
        // NewsSortedTable *destVC = (NewsSortedTable *)segue.destinationViewController;
        
        NewsSortedTable *destVC = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSLog(@"Value of indexPathRow = %lu", indexPath.row);
        destVC.title = self.newsData.category[indexPath.row];
        destVC.cellTapped = self.newsData.category[indexPath.row];
    }
}

@end
