//
//  AD8LevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "AD8LevelTestViewController.h"
#import "AD8LevelFinishViewController.h"

@interface AD8LevelTestViewController ()

@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionTitle;
@property (nonatomic,weak) IBOutlet UISegmentedControl *QuestionSelectControl;
@property (nonatomic,weak) IBOutlet UIButton *btnShowNextQuestion;
@property (nonatomic,weak) IBOutlet UIButton *btnShowFinish;

@property (nonatomic,weak) IBOutlet UIImageView *imageViewQuestionImage;
@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionDesc;


@property (nonatomic) NSUInteger QuestionAnswer;

- (IBAction)QuestionSelected:(id)sender;
- (IBAction)Cancel:(id)sender;


- (void)LoadQuestion;
- (void)UpdateQuestionAnswer;


@end

@implementation AD8LevelTestViewController

@synthesize LevelTests,QuestionIndex, textViewQuestionTitle, QuestionSelectControl,
btnShowFinish, btnShowNextQuestion, QuestionAnswer, textViewQuestionDesc, imageViewQuestionImage;
@synthesize user;

#pragma mark - Actions




- (void)LoadQuestion
{
    
    //初始值
    QuestionAnswer = 0;
    
        
    if (QuestionIndex <= LevelTests.count)
    {
        if (QuestionIndex == LevelTests.count)
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
        
        NSMutableDictionary * questionItem = [LevelTests objectAtIndex:QuestionIndex-1];
        NSString *questionTitle = [questionItem objectForKey:@"QuestionTitle"];
        NSString *questionDesc = [questionItem objectForKey:@"QuestionDesc"];
        NSString *questionImage = [questionItem objectForKey:@"QuestionImage"];
        
        self.textViewQuestionTitle.text = questionTitle;
        self.textViewQuestionDesc.text = questionDesc;
        
        if (questionImage.length >0)
        {
            //加载图片
            NSString *QuestionImageFullPath = [[NSBundle mainBundle] pathForResource:[questionImage stringByDeletingPathExtension] ofType:[questionImage pathExtension] inDirectory:@"Level_Q/Level_QAD8/Images"];
            
            
            NSLog(@"imageFullPath:%@",QuestionImageFullPath);
            
            self.imageViewQuestionImage.image = [UIImage imageWithContentsOfFile:QuestionImageFullPath];
            
            
            //self.imageViewQuestionImage.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:[questionImage stringByDeletingPathExtension] ofType:[questionImage pathExtension] inDirectory:@"Level_Q/Level_QAD8/Images"]];
        }
        
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
    NSUInteger  isSelected= 1;
    
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
            isSelected = 0;
            break;
    }
    
    NSLog(@"%d",isSelected);
    
    if ( isSelected == 1)
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
    
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_AD8"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            AD8LevelTestViewController *ad8LevelTestViewController = (AD8LevelTestViewController *) [segue destinationViewController];
            ad8LevelTestViewController.LevelTests = LevelTests;
            ad8LevelTestViewController.QuestionIndex  = QuestionIndex +1;
            ad8LevelTestViewController.user = user;
            
        }

        
    }
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelFinishView_AD8"])
    {
        
        AD8LevelFinishViewController * ad8LevelFinishViewController = (AD8LevelFinishViewController *)[segue destinationViewController];
        ad8LevelFinishViewController.LevelTests = LevelTests;
        
        ad8LevelFinishViewController.user = user;
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
    
    self.title = [NSString stringWithFormat:@"AD8量表  %d / %d", QuestionIndex, LevelTests.count];
    
 
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return  (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);;
}

@end
