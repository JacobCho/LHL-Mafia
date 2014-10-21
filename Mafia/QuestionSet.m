//
//  QuestionSet.m
//  Mafia
//
//  Created by Jacob Cho on 2014-10-20.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "QuestionSet.h"

@implementation QuestionSet

-(instancetype)init {
    
    self = [super init];
    
    self.questionsList = @[@"What year was Al Capone born in?",
                           @"What month was the St Valentine's day massacre?",
                           @"Name that gangster: Lucky ____________",
                           @"The ______ families are the original Italian American Mafia crime families of New York City"];
    
    self.answerList = @[@[@"1917", @"1918", @"1919", @"1920"],
                        @[@"February", @"May", @"June", @"November"],
                        @[@"Larry", @"Sonny", @"Stephano", @"Luciano"],
                        @[@"Ten", @"Sicilian", @"Five", @"Genovese"]];
    
    
    return self;
    
}


-(NSString *)returnQuestion:(int)questionNumber {
    
    return [self.questionsList objectAtIndex:questionNumber];
    
}

-(NSArray *)returnAnswerSet:(int)questionNumber {
    return [self.answerList objectAtIndex:questionNumber];
}

-(int)checkAnswer:(int)questionNumber {
    
    
    switch (questionNumber) {
        case 0:
            return 1;
            break;
        case 1:
            return 0;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 2;
            break;
        default:
            return nil;
            break;
    }
    
    
}


@end
