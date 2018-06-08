//
//  HomeTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 30.05.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "HomeTable.h"
#import "NewsData.h"

@interface HomeTable ()

// leftBarButtonItem can be used to place a logo in the Navigationbar
// @property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButtonItem;
@property (strong, nonatomic) NewsData *newsData;

@end

@implementation HomeTable


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // For demonstration purposes the data is added statically
    self.newsData = [[NewsData alloc] init];
    self.newsData.images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                             @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                             @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsData.images.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeTableCell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:self.newsData.images[indexPath.row]];
    cell.textLabel.text = @"Ordne Deine lieblings Hoster per Drag & Drop um schneller zum gewünschten Stream zu kommen!";
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 3;
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

/*
 #pragma mark - Navigation
 */
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"homeDetail"]) {
        UIViewController *destinationVC = [segue destinationViewController];
        destinationVC.title = @"Detail";
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [destinationVC setValue:self.newsData.images[indexPath.row] forKey:@"imageName"];
    }
}

@end
