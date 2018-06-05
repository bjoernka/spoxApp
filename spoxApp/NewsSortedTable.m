//
//  NewsSortedTable.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 04.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "NewsSortedTable.h"
#import "NewsData.h"

@interface NewsSortedTable ()
@property (strong, nonatomic) NewsData *newsData;
@property NSMutableArray* selecPics;
@end

@implementation NewsSortedTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsData = [[NewsData alloc] init];
    self.newsData.images = @[@"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                               @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5",
                               @"examPic1", @"examPic2", @"examPic3", @"examPic4", @"examPic5"];
    
    self.newsData.category= @[@"examCat1", @"examCat2", @"examCat3", @"examCat4", @"examCat5",
                              @"examCat1", @"examCat2", @"examCat3", @"examCat4", @"examCat5",
                              @"examCat1", @"examCat2", @"examCat3", @"examCat4", @"examCat5"];
    
    NSString *category = [[NSString alloc]init];
    int counter = -1;
    _selecPics = [[NSMutableArray alloc]init];
    
    for (category in self.newsData.category) {
        counter += 1;
        NSLog(@"Value of counter = %d", counter);
        if (category == self.cellTapped){
            NSString *categoryName = [self.newsData.category objectAtIndex:counter];
            [_selecPics addObject:[NSNumber numberWithInt:counter]];
            NSLog(@"Value of categoryName = %@", categoryName);
        } else {
        }
    }
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"Value of selecPics = %@", _selecPics);
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
    return _selecPics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsSortCell" forIndexPath:indexPath];
    
    NSNumber *selecPicsNumber = (NSNumber*)_selecPics[indexPath.row];
    NSInteger selecPicsInt = [selecPicsNumber integerValue];
    NSLog(@"Value of selecPicsNumber = %@", selecPicsNumber);
    cell.imageView.image = [UIImage imageNamed:[self.newsData.images objectAtIndex:selecPicsInt]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    if ([segue.identifier  isEqual: @"newsSortedDetail"]) {
        UIViewController *destinationVC = [segue destinationViewController];
        destinationVC.title = @"Detail";
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSNumber *selecPicsNumber = (NSNumber*)_selecPics[indexPath.row];
        NSInteger selecPicsInt = [selecPicsNumber integerValue];
        [destinationVC setValue:[self.newsData.images objectAtIndex:selecPicsInt] forKey:@"imageName"];
    }
}

@end
