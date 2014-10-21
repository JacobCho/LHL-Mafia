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

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:YES];
    
    self.user.mafia = NO;
    self.user.sheriff = NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    self.user = [[User alloc] init];
    
    if(sender == self.mafiaButton) {
        
        self.user.mafia = YES;
        
        GameViewController *gVC = segue.destinationViewController;
        
        gVC.user = self.user;
        
    }
    
    else if(sender == self.sheriffButton) {
        
        self.user.sheriff = YES;
        
        GameViewController *gVC = segue.destinationViewController;
        
        gVC.user = self.user;
        
    }
    
}

- (IBAction)mafiaButtonPressed:(UIButton *)sender {
    
    self.user.mafia = YES;
    
}

- (IBAction)sheriffButtonPressed:(UIButton *)sender {
    
    self.user.sheriff = YES;
}
@end
