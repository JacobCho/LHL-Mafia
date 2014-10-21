//
//  GameViewController.m
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "GameViewController.h"
#import "MiniGameViewController.h"


@interface GameViewController () <MiniGameViewControllerDelegate>

@end

@implementation GameViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numOfVillagers = 5;
    
    if (self.user.mafia) {
        [self setupMafia];
        NSLog(@"Mafia setup!");
    }
    
    else if (self.user.sheriff){
        
        [self setupSheriff];
         NSLog(@"Sheriff setup!");
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    self.villagerCount.text = [NSString stringWithFormat:@"There are %d villagers in the village.", self.numOfVillagers];
    
    
}

- (void)setupMafia{
    
    self.welcomeMessage.text = @"You have chosen the role of Mafia.  Welcome to the village.";
    self.instructionsText.text = @"Your objective is to kill all the villagers before the sheriff finds you.  Pressing the button below will start a mini game, where successful completion will kill off one villager.  Kill them all to win.";
}

-(void)setupSheriff {
    
    self.welcomeMessage.text = @"You have chosen the role of Sheriff.  Welcome to the village.";
    self.instructionsText.text = @"Your objective is to find the Mafia before all the villagers are killed. Pressing the button below will start a mini game, where successful completion will give you a chance to find the mafia amoung the villagers.";
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"minigameSegue"]) {
        
        MiniGameViewController *miniGVC = segue.destinationViewController;
        
        miniGVC.delegate = self;
        
    }
    
    
}


-(void)didWinMiniGame {
    
    if (self.user.mafia) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Right!" message:@"A villager has been killed!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alertView show];

        self.numOfVillagers--;
    } else if (self.user.sheriff) {
        
        
    }
}

-(void)didLoseMiniGame {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Wrong!" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
    
}

-(void)findMafia {
    
    
}





@end
