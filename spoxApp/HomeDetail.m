//
//  HomeDetail.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 31.05.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "HomeDetail.h"

@interface HomeDetail ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView.image = [UIImage imageNamed:_imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
