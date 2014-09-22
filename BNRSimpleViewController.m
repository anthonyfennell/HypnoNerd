//
//  BNRSimpleViewController.m
//  Simple
//
//  Created by Anthony Fennell on 8/23/14.
//  Copyright (c) 2014 Anthony Fennell. All rights reserved.
//

#import "BNRSimpleViewController.h"

@interface BNRSimpleViewController ()

@property (nonatomic) int currentQuestionIndex;

@property NSArray *questions;
@property NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRSimpleViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        //self.tabBarItem.title = @"Quiz";
        
        // Create a UIImage from a file
        // This will use Time@2x.png on retina display devices
        //UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        //self.tabBarItem.image = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questions = [[NSArray alloc] init];
    self.answers = [[NSArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    self.questions = @[@"From what is cognac made?",
                       @"What is 7+7?",
                       @"What is the capital of Vermont?",
                       @"What is inheritance?",
                       @"Where do Objective-C objects live?",
                       @"What does the acronym ARC stand for?",
                       @"Destroying an object that is still needed",
                       @"How is an object with a weak reference destroyed?"];
    self.answers = @[@"Grapes",
                     @"14",
                     @"Montpelier",
                     @"When a class is based off of another class",
                     @"In the heap silly!",
                     @"Automatic Reference Counting, for your applications memory management",
                     @"Premature deallocation or dangling reference",
                     @"It knows when the object it points to is destroyed and then sets itself to nil"];
}

- (IBAction)showQuestion:(id)sender {
    
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
