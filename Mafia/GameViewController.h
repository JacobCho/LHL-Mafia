//
//  GameViewController.h
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface GameViewController : UIViewController

@property (nonatomic, strong) User *user;
@property (strong, nonatomic) IBOutlet UITextView *welcomeMessage;
@property (strong, nonatomic) IBOutlet UILabel *villagerCount;
@property (strong, nonatomic) IBOutlet UITextView *instructionsText;


@end
