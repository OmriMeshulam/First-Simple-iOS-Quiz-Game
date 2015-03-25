//
//  QuizViewController.m
//  Quiz
//
//  Created by Omri Meshulam on 2/14/15.
//  Copyright (c) 2015 OmriMeshulam. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;


@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // create 2 arrays filled with questions and answers.
        // and make pointers to them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    //return the address of the new object
    return self;
    
}


- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // If past the last question
    if (self.currentQuestionIndex == [self.questions count]){
        //go back to first question
        self.currentQuestionIndex = 0;
    }
    
    //get the string at the index in the question array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    [self animateLabel:self.questionLabel withString:question];
    
    // Don't do anything if the text is ???
    if (![self.answerLabel.text isEqualToString:@"???"]) {
        [self animateLabel:self.answerLabel withString:@"???"];
    }
    
    
}
- (IBAction)showAnswer:(id)sender
{
    //string answer to current question
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    [self animateLabel:self.answerLabel withString:answer];
}

- (void)animateLabel:(UILabel *)label withString:(NSString *)string
{
    // To maintain the original position
    CGRect currentRect = label.frame;
    
    // lefttRect has the far left poisition in the X-Axis
    CGRect leftRect = currentRect;
    leftRect.origin.x = 0 - label.frame.size.width;
    
    // rightRect has the far right position in the X-Axis
    CGRect rightRect = currentRect;
    rightRect.origin.x = [[UIScreen mainScreen] bounds].size.width;
    
    // The first animation moves the label to right
    // and the second one changes the text moves the label to the far left and
    // then moves the label to the original position
    // Both change the alpha values of the labels.
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         label.frame = rightRect;
                         label.alpha = 0;
                         
                     } completion:^(BOOL finished){
                         label.text = string;
                         label.frame = leftRect;
                         [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              label.frame = currentRect;
                                              label.alpha = 1;
                                          } completion:NULL
                          ];
                     }];
}

@end

