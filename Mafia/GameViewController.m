//
//  GameViewController.m
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () {
    
    int numOfVillagers;
    
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    numOfVillagers = 10;
    
    if (self.user.mafia) {
        [self setupMafia];
        NSLog(@"Mafia setup!");
    }
    
    else if (self.user.sheriff){
        
        [self setupSheriff];
         NSLog(@"Sheriff setup!");
    }
    
    self.villagerCount.text = [NSString stringWithFormat:@"There are %d villagers in the village.", numOfVillagers];
    
}

- (void)setupMafia{
    
    self.welcomeMessage.text = @"You have chosen the role of Mafia.  Welcome to the village.";
    self.instructionsText.text = @"Your objective is to kill all the villagers before the sheriff finds you.  Pressing the button below will start a mini game, where successful completion will kill off one villager.  Kill them all to win.";
}

-(void)setupSheriff {
    
    self.welcomeMessage.text = @"You have chosen the role of Sheriff.  Welcome to the village.";
    self.instructionsText.text = @"Your objective is to find the Mafia before all the villagers are killed. Pressing the button below will start a mini game, where successful completion will give you a chance to find the mafia amoung the villagers.";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
