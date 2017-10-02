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

