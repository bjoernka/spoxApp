//
//  HomeTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 30.05.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "HomeTable.h"

@interface HomeTable ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButtonItem;

@end

@implementation HomeTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tableView.backgroundColor = UIColor.darkGrayColor;
//    self.navigationController.navigationBar.backgroundColor = UIColor.darkGrayColor;
//    self.tabBarController.tabBar.backgroundColor = UIColor.darkGrayColor;
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
    _images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
    
    return _images.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeTableCell" forIndexPath:indexPath];
    
    _bearImage = [UIImage imageNamed:_images[indexPath.row]];
    cell.imageView.image = _bearImage;
    cell.textLabel.text = @"Ordne Deine lieblings Hoster per Drag & Drop um schneller zum gewünschten Stream zu kommen!";
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.adjustsFontSizeToFitWidth = true;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//  cell.backgroundColor = UIColor.darkGrayColor;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;;
    
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
    _images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
    
    if ([segue.identifier  isEqual: @"homeDetail"]) {
        UIViewController *destinationVC = [segue destinationViewController];
        destinationVC.title = @"Detail";
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [destinationVC setValue:_images[indexPath.row] forKey:@"imageName"];
    }
}

@end
