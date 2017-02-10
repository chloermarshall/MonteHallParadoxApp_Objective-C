//
//  ViewController.h
//  Monte Hall Paradox
//
//  Created by Chloe Marshall on 2/7/17.
//  Copyright © 2017 Chloe Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *door1;
@property (weak, nonatomic) IBOutlet UIImageView *door2;
@property (weak, nonatomic) IBOutlet UIImageView *door3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *doorSelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *keepSwitchSelector;
@property (weak, nonatomic) IBOutlet UILabel *selectLabel;
@property (weak, nonatomic) IBOutlet UIButton *revealButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;
@property (weak, nonatomic) IBOutlet UILabel *keepTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *keepWinLabel;
@property (weak, nonatomic) IBOutlet UILabel *keepLossLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchWinLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLossLabel;

- (IBAction)doorSelected:(id)sender;
- (IBAction)keepSwitch:(id)sender;
- (IBAction)revealDoorButtonAction:(id)sender;
- (IBAction)showResultButtonAction:(id)sender;
- (IBAction)resetButtonAction:(id)sender;
- (void) showArrow;
- (void) revealDoor1;
- (void) revealDoor2;
- (void) revealDoor3;
- (void) resetDoors;






@end

