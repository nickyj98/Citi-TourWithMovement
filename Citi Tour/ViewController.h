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

- (IBAction)Welcome:(id)sender;
- (IBAction)First:(id)sender;

@end

