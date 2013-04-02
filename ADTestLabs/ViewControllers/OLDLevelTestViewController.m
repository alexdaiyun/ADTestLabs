//
//  OLDLevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "OLDLevelTestViewController.h"
#import "OLDLevelFinishViewController.h"

@interface OLDLevelTestViewController ()

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

@implementation OLDLevelTestViewController

@synthesize LevelTests,QuestionIndex, textViewQuestionTitle, QuestionSelectControl,
btnShowFinish, btnShowNextQuestion, QuestionAnswer;

#pragma mark - Actions




- (void)LoadQuestion
{
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
            btnShowNextQuestion.enabled = YES;
            btnShowNextQuestion.hidden = NO;
            
            btnShowFinish.enabled = NO;
            btnShowFinish.hidden = YES;
        }
        
        //根据QuestionIndex 获得当前的Question
        
        NSMutableDictionary * questionItem = [LevelTests objectAtIndex:QuestionIndex];
        NSString *questionTitle = [questionItem objectForKey:@"QuestionTitle"];
        
        self.textViewQuestionTitle.text = questionTitle;
        
    }
    
    //初始值
    QuestionAnswer = 0;
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
            QuestionAnswer = 0;
            break;
        case 1:
            QuestionAnswer = 1;
            break;
        case 2:
            QuestionAnswer = 0;
            break;
            
            
        default:
            QuestionAnswer = 0;
            break;
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
    
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_OLD"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            OLDLevelTestViewController *oldLevelTestViewController = (OLDLevelTestViewController *) [segue destinationViewController];
            oldLevelTestViewController.LevelTests = LevelTests;
            oldLevelTestViewController.QuestionIndex  = QuestionIndex +1;
            
            
        }
        
        
    }
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelFinishView_OLD"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            OLDLevelFinishViewController *oldLevelFinishViewController = (OLDLevelFinishViewController *)[segue destinationViewController];
            oldLevelFinishViewController.LevelTests = LevelTests;
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
