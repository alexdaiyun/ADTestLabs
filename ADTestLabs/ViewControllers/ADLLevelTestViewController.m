//
//  ADLLevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADLLevelTestViewController.h"
#import "ADLLevelFinishViewController.h"

@interface ADLLevelTestViewController ()

@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionTitle;
@property (nonatomic,retain) IBOutlet UISegmentedControl *QuestionSelectControl;
@property (nonatomic,retain) IBOutlet UIButton *btnShowNextQuestion;
@property (nonatomic,retain) IBOutlet UIButton *btnShowFinish;

@property (nonatomic) NSUInteger QuestionAnswer;

- (IBAction)QuestionSelected:(id)sender;
- (IBAction)Cancel:(id)sender;


- (void)LoadQuestion;
- (void)UpdateQuestionAnswer;


@end

@implementation ADLLevelTestViewController



@synthesize LevelTests,QuestionIndex, textViewQuestionTitle, QuestionSelectControl,
btnShowFinish, btnShowNextQuestion, QuestionAnswer;

#pragma mark - Actions




- (void)LoadQuestion
{
    
    //初始值
    QuestionAnswer = 0;
    
    if (QuestionIndex < LevelTests.count)
    {
        if (QuestionIndex == LevelTests.count-1)
        {
            btnShowFinish.enabled = YES;
            btnShowFinish.hidden = NO;
            
            btnShowNextQuestion.enabled = NO;
            btnShowNextQuestion.hidden = YES;
        }
        else
        {
 
            btnShowNextQuestion.enabled = NO;
            
            
            btnShowNextQuestion.hidden = YES;
            
            btnShowFinish.enabled = NO;
            btnShowFinish.hidden = YES;
        }
        
        //根据QuestionIndex 获得当前的Question
        
        NSMutableDictionary * questionItem = [LevelTests objectAtIndex:QuestionIndex];
        NSString *questionTitle = [questionItem objectForKey:@"QuestionTitle"];
        
        self.textViewQuestionTitle.text = questionTitle;
        
    }
    

}

- (void)UpdateQuestionAnswer
{
    if (QuestionIndex < LevelTests.count)
    {
        NSMutableDictionary *questionItem = [[LevelTests objectAtIndex:QuestionIndex] mutableCopy];
        
        [questionItem setValue:[NSNumber numberWithInteger:QuestionAnswer ]forKey:@"Answer"];
        [LevelTests replaceObjectAtIndex:QuestionIndex withObject:questionItem];
    }
}


- (IBAction)QuestionSelected:(id)sender
{
 
    switch ([QuestionSelectControl selectedSegmentIndex]) {
        case 0:
            QuestionAnswer = 1;
            break;
        case 1:
            QuestionAnswer = 2;
            break;
        case 2:
            QuestionAnswer = 3;
            break;
        case 3:
            QuestionAnswer = 4;
            break;
        default:
            QuestionAnswer = 0;
            break;
    }
    
    if ( QuestionAnswer >0)
    {
        btnShowNextQuestion.enabled = YES;
        btnShowNextQuestion.hidden = NO;
    }
}

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self UpdateQuestionAnswer];
    
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_ADL"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            ADLLevelTestViewController *adlLevelTestViewController = (ADLLevelTestViewController *) [segue destinationViewController];
            adlLevelTestViewController.LevelTests = LevelTests;
            adlLevelTestViewController.QuestionIndex  = QuestionIndex +1;
            
            
        }
        
        
    }
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelFinishView_ADL"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            ADLLevelTestViewController *adlLevelTestViewController = (ADLLevelTestViewController *)[segue destinationViewController];
            adlLevelTestViewController.LevelTests = LevelTests;
        }
        
    }
    
    
    
}


#pragma mark - View lifecyle





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self LoadQuestion];
    
    self.title = [NSString stringWithFormat:@"%d / %d", QuestionIndex, LevelTests.count-1];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
