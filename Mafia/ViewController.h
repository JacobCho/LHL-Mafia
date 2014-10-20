//
//  ViewController.h
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) User *user;
@property (strong, nonatomic) IBOutlet UIButton *mafiaButton;
@property (strong, nonatomic) IBOutlet UIButton *sheriffButton;

- (IBAction)mafiaButtonPressed:(UIButton *)sender;
- (IBAction)sheriffButtonPressed:(UIButton *)sender;


@end

