//
//  QuestionSet.h
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionSet : NSObject

@property (nonatomic, strong) NSArray *questionsList;
@property (nonatomic, strong) NSArray *answerList;

-(NSString *)returnQuestion:(int)questionNumber;
-(NSArray *)returnAnswerSet:(int)questionNumber;
-(int)checkAnswer:(int)questionNumber;

@end
