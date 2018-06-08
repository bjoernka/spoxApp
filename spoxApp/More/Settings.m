//
//  Settings.m
//  spoxApp
//
//  Created by Björn Kaczmarek on 07.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import "Settings.h"

@interface Settings ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property NSArray *pickerData;
@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.pickerData = @[@"4", @"5", @"6", @"7", @"8"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger pickerValue = [defaults integerForKey:@"pickerValue"];
    if (pickerValue != 0) {
        NSLog(@"picker not nil");
        [self.pickerView selectRow:pickerValue inComponent:0 animated:true];
    } else {
        NSLog(@"picker is nil");
        [self.pickerView selectRow:3 inComponent:0 animated:false];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerData.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerData[row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:row forKey:@"pickerValue"];
    [defaults synchronize];
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
