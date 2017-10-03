//
//  ViewController.h
//  Citi Tour
//
//  Created by FSP NYP on 28/9/17.
//  Copyright © 2017 FSP NYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *image;
}

@property (weak, nonatomic) IBOutlet UILabel *Readtext;
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *ReaderText;
@property (weak, nonatomic) IBOutlet UITextView *Readingtext;

//manual controls
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



//tour mode
- (IBAction)FullTour:(id)sender;
- (IBAction)R2B:(id)sender;


- (IBAction)Welcome:(id)sender;
- (IBAction)First:(id)sender;
- (IBAction)Second:(id)sender;
- (IBAction)Third:(id)sender;
- (IBAction)Fourth:(id)sender;
- (IBAction)Fifth:(id)sender;
- (IBAction)Sixth:(id)sender;
- (IBAction)Ending:(id)sender;

@end

