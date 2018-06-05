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
    
    _imageView.image = [UIImage imageNamed:_imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
