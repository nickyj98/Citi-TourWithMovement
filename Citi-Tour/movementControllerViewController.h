//
//  movementControllerViewController.h
//  Citi Tour
//
//  Created by FSP NYP on 4/10/17.
//  Copyright © 2017 FSP NYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface movementControllerViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *ConnectionStatus;
@property (weak, nonatomic) IBOutlet UILabel *ParkingStatus;
@property (weak, nonatomic) IBOutlet UILabel *PlayStatus;
@property (weak, nonatomic) IBOutlet UILabel *BatteryPercent;
- (IBAction)poleup:(id)sender;
- (IBAction)polestop:(id)sender;
- (IBAction)poledown:(id)sender;
- (IBAction)park:(id)sender;
- (IBAction)deploy:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *DriveRightButton;
@property (weak, nonatomic) IBOutlet UIButton *DriveLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *DriveBackButton;
@property (weak, nonatomic) IBOutlet UIButton *DriveFrontButton;

@end
