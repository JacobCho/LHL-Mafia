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
        [self mafiaWinCheck];
    } else if (self.user.sheriff) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Right!" message:@"Mafia search conducted. You're getting closer." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alertView show];
        
        [self findMafia];
    }
}

-(void)didLoseMiniGame {
    
    
    if (self.user.mafia) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Wrong!" message:@"The sheriff is getting closer!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        
        [self findMafia];
    }
    else if (self.user.sheriff) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Wrong!" message:@"The mafia is getting away!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    
}

-(void)findMafia {
    
    NSInteger *sheriffSearch = (int)(arc4random()% self.numOfVillagers + 1);
    
    NSInteger *mafiaEscape = (int)(arc4random()% self.numOfVillagers + 1);
    
    
    if (sheriffSearch == mafiaEscape) {
        
        if (self.user.mafia) {
        
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You have been found!" message:@"Game Over" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertView show];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else if (self.user.sheriff) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You found the mafia!" message:@"The Mafia has confessed to his crimes. You win!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertView show];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    }
    
    
}

-(void)mafiaWinCheck {
    
    if (self.numOfVillagers == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Villagers killed!" message:@"All villagers have been killed! You have won the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}



@end
