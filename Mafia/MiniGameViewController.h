//
//  MiniGameViewController.h
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionSet.h"


@protocol MiniGameViewControllerDelegate <NSObject>

-(void)didWinMiniGame;
-(void)didLoseMiniGame;

@end

@interface MiniGameViewController : UIViewController

@property (nonatomic, weak) id <MiniGameViewControllerDelegate> delegate;




@end
