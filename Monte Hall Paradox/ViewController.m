//
//  ViewController.m
//  Monte Hall Paradox
//
//  Created by Chloe Marshall on 2/7/17.
//  Copyright © 2017 Chloe Marshall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    AVAudioPlayer *_audioPlayerWin;
    AVAudioPlayer *_audioPlayerLose;
}

@end

@implementation ViewController

@synthesize door1;
@synthesize door2;
@synthesize door3;
@synthesize doorSelector;
@synthesize keepSwitchSelector;
@synthesize selectLabel;
@synthesize revealButton;
@synthesize showButton;
@synthesize resetButton;
@synthesize arrow1;
@synthesize arrow2;
@synthesize arrow3;
@synthesize keepTotalLabel;
@synthesize keepWinLabel;
@synthesize keepLossLabel;
@synthesize switchWinLabel;
@synthesize switchLossLabel;
@synthesize switchTotalLabel;

int doorWinner;
int playerChoice;
int doorRevealed;
int keepTotalCounter;
int switchTotalCounter;
int keepWinCounter;
int switchWinCounter;
int keepLossCounter;
int switchLossCounter;
bool isWinner;


UIImageView  *imageView1;
UIImageView  *imageView2;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *winnerPath = [NSString stringWithFormat:@"%@/WINNER.WAV", [[NSBundle mainBundle] resourcePath]];
    NSString *loserPath = [NSString stringWithFormat:@"%@/LoserHorns.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrlWin = [NSURL fileURLWithPath:winnerPath];
    NSURL *soundUrlLose = [NSURL fileURLWithPath:loserPath];
    
    _audioPlayerWin = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrlWin error:nil];
    _audioPlayerLose = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrlLose error:nil];

    
    
    // Do any additional setup after loading the view, typically from a nib.
    doorWinner = ((arc4random() % 3) + 1);
    keepTotalCounter = 0;
    switchTotalCounter = 0;
    keepWinCounter = 0;
    switchWinCounter = 0;
    keepLossCounter = 0;
    switchLossCounter = 0;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doorSelected:(id)sender {
    selectLabel.hidden = TRUE;
    revealButton.hidden = FALSE;
    doorSelector.hidden = TRUE;
    
    if(doorSelector.selectedSegmentIndex == 0){
        playerChoice = 1;
    }
    if(doorSelector.selectedSegmentIndex == 1){
        playerChoice = 2;
    }
    if(doorSelector.selectedSegmentIndex == 2){
        playerChoice = 3;
    }
    //Why would we need to create a new function (show arrow) if we can just put the methods in here
    [self showArrow];
}

- (void) showArrow {
    if(playerChoice == 1){
        arrow1.hidden = FALSE;
        arrow2.hidden = TRUE;
        arrow3.hidden = TRUE;
    }
    if(playerChoice == 2){
        arrow1.hidden = TRUE;
        arrow2.hidden = FALSE;
        arrow3.hidden = TRUE;
    }
    if(playerChoice == 3){
        arrow1.hidden = TRUE;
        arrow2.hidden = TRUE;
        arrow3.hidden = FALSE;
    }
    
}

- (IBAction)keepSwitch:(id)sender {
    if(keepSwitchSelector.selectedSegmentIndex == 1){
        if(doorRevealed == 1){
            if(playerChoice == 2)
            {
                playerChoice = 3;
            }else{
                playerChoice = 2;
            }
        }
        if(doorRevealed == 2){
            if(playerChoice == 1)
            {
                playerChoice = 3;
            }else{
                playerChoice = 1;
            }
        }
        if(doorRevealed == 3){
            if(playerChoice == 1)
            {
                playerChoice = 2;
            }else{
                playerChoice = 1;
            }
        }
        [self showArrow];
        switchTotalCounter += 1;
        if(playerChoice == doorWinner){
            switchWinCounter += 1;
            isWinner = TRUE;
        }else{
            switchLossCounter += 1;
            isWinner = FALSE;
        }
    }else{
        keepTotalCounter += 1;
        if(playerChoice == doorWinner){
            keepWinCounter += 1;
            isWinner = TRUE;
        }else{
            keepLossCounter += 1;
            isWinner = FALSE;
        }
    }
    keepSwitchSelector.hidden = TRUE;
    showButton.hidden = FALSE;
}

- (IBAction)revealDoorButtonAction:(id)sender {
    bool selectionRepeat = TRUE;
    
    while(selectionRepeat){
        doorRevealed = ((arc4random() % 3) +1);
        if(doorRevealed != doorWinner && doorRevealed != playerChoice)
        {
            selectionRepeat = FALSE;
        }

    }
    if(doorRevealed == 1) [self revealDoor1];
    if(doorRevealed == 2) [self revealDoor2];
    if(doorRevealed == 3) [self revealDoor3];
    
    revealButton.hidden = TRUE;
    keepSwitchSelector.hidden = FALSE;
}

- (void) revealDoor1{
    
    if(doorWinner == 1){
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"winner"]];
    } else {
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"looser"]];
    }
    [imageView2 setFrame:CGRectMake(36, 34, 82, 72)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:(1.50)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: door1 cache:YES];
    
    [door1 addSubview:imageView2];
    
    [UIView commitAnimations];
    
}
- (void) revealDoor2{
    
    if(doorWinner == 2){
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"winner"]];
    } else {
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"looser"]];
    }
    [imageView2 setFrame:CGRectMake(36, 34, 82, 72)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:(1.50)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: door2 cache:YES];
    
    [door2 addSubview:imageView2];
    
    [UIView commitAnimations];
    
}
- (void) revealDoor3{
    
    if(doorWinner == 3){
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"winner"]];
    } else {
        imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"looser"]];
    }
    [imageView2 setFrame:CGRectMake(36, 34, 82, 72)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:(1.50)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView: door3 cache:YES];
    
    [door3 addSubview: imageView2];
    
    [UIView commitAnimations];
    
}

- (void) transitionDidStop: (NSString *)animationID finished:(BOOL) finished context: (void*) context{
    NSLog(@"Transition Finished");
}

- (IBAction)showResultButtonAction:(id)sender {
    [self revealDoor1];
    [self revealDoor2];
    [self revealDoor3];
    
    showButton.hidden = TRUE;
    resetButton.hidden = FALSE;
    
    keepTotalLabel.text = [[NSString alloc] initWithFormat:@"%d", keepTotalCounter];
    keepWinLabel.text = [[NSString alloc] initWithFormat:@"%d", keepWinCounter];
    keepLossLabel.text = [[NSString alloc] initWithFormat:@"%d", keepLossCounter];
    switchTotalLabel.text = [[NSString alloc] initWithFormat:@"%d", switchTotalCounter];
    switchWinLabel.text = [[NSString alloc] initWithFormat:@"%d", switchWinCounter];
    switchLossLabel.text = [[NSString alloc] initWithFormat:@"%d", switchLossCounter];
    
    if(isWinner){
        [_audioPlayerWin play];
    }else{
        [_audioPlayerLose play];
    }


}

- (IBAction)resetButtonAction:(id)sender {
    
    doorWinner = ((arc4random() % 3) +1);
    resetButton.hidden = TRUE;
    
    [self resetDoors];
    
    arrow1.hidden = TRUE;
    arrow2.hidden = TRUE;
    arrow3.hidden = TRUE;
    doorSelector.hidden = FALSE;
    
    [doorSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [keepSwitchSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    
}

- (void) resetDoors {
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 163, 156)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView: door1 cache:YES];
    [imageView2 removeFromSuperview];
    [door1 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 163, 156)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView: door2 cache:YES];
    [imageView2 removeFromSuperview];
    [door2 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 163, 156)];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView: door3 cache:YES];
    [imageView2 removeFromSuperview];
    [door3 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    
}
@end
