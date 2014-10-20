//
//  ViewController.m
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ViewController.h"
#import "GameViewController.h"

@interface ViewController () 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"enterGameSegue"]) {
        
        GameViewController *gameVC = segue.destinationViewController;
        
        gameVC.user = self.user;
    }
    
}

- (IBAction)mafiaButtonPressed:(UIButton *)sender {
    
    self.user.mafia = YES;
    
}

- (IBAction)sheriffButtonPressed:(UIButton *)sender {
    
    self.user.sheriff = YES;
}
@end
