//
//  movementControllerViewController.m
//  Citi Tour
//
//  Created by FSP NYP on 4/10/17.
//  Copyright © 2017 FSP NYP. All rights reserved.
//

#import "movementControllerViewController.h"
#import <DoubleControlSDK/DoubleControlSDK.h>

@interface movementControllerViewController ()<DRDoubleDelegate>


@end

@implementation movementControllerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [DRDouble sharedDouble].delegate = self;
    NSLog(@"SDL Version: %@", kDoubleBasicSDKVersion);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doubleDidConnect:(DRDouble *)theDouble{
    NSLog(@"DoubleDidConnect");
    _ConnectionStatus.text = @"Connected";
    
}

-(void)doubleDidDisconnect:(DRDouble *)theDouble{
    NSLog(@"DoubleDidDisconnect");
    _ConnectionStatus.text = @"Not Connected";
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
