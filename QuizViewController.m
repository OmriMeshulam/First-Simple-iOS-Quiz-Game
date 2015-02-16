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
    
    //display the string in the question label
    self.questionLabel.text = question;
    
    //reset the answer label
    self.answerLabel.text = @"???";
    
    
}
- (IBAction)showAnswer:(id)sender
{
    //string answer to current question
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //displaying in the answer label
    self.answerLabel.text = answer;
}

@end

