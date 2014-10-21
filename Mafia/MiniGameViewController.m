//
//  MiniGameViewController.m
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "MiniGameViewController.h"

@interface MiniGameViewController ()

@property (nonatomic, assign) NSInteger questionNumber;
@property (nonatomic, copy) NSArray *answerSet;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;

@end

@implementation MiniGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    self.questionNumber = (int)(arc4random()%4);
    
    QuestionSet *question = [[QuestionSet alloc] init];
    
    self.questionLabel.text = [question returnQuestion:self.questionNumber];
    
    self.answerSet = [question returnAnswerSet:self.questionNumber];
    
    [self.topLeftButton setTitle:[self.answerSet objectAtIndex:0] forState:UIControlStateNormal];
    [self.topRightButton setTitle:[self.answerSet objectAtIndex:1] forState:UIControlStateNormal];
    [self.bottomLeftButton setTitle:[self.answerSet objectAtIndex:2] forState:UIControlStateNormal];
    [self.bottomRightButton setTitle:[self.answerSet objectAtIndex:3] forState:UIControlStateNormal];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)topLeftPressed:(UIButton *)sender {
    
    [self validateUserAnswer:0];
}

- (IBAction)topRightPressed:(UIButton *)sender {
    
    [self validateUserAnswer:1];
}

- (IBAction)bottomleftPressed:(UIButton *)sender {
    
    [self validateUserAnswer:2];

}

- (IBAction)bottomRightPressed:(UIButton *)sender {
    
    [self validateUserAnswer:3];
}

-(void)validateUserAnswer:(NSInteger)userAnswer {
    
    QuestionSet *question = [[QuestionSet alloc] init];
    
    if (userAnswer == [question checkAnswer:self.questionNumber]) {
        [self.delegate didWinMiniGame];
        
    } else {
        [self.delegate didLoseMiniGame];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}



@end
