//
//  Imprint.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 07.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "Imprint.h"

@interface Imprint ()
@property (weak, nonatomic) IBOutlet UILabel *telefonLabel;
@property (weak, nonatomic) IBOutlet UILabel *eMailLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

@end

@implementation Imprint

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
