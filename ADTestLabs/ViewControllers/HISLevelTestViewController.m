//
//  HISDLevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HISLevelTestViewController.h"
#import "HISLevelFinishViewController.h"

@interface HISLevelTestViewController ()


@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionTitle;
@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionDesc;
@property (nonatomic,weak) IBOutlet UIImageView *imageViewQuestionImage;
@property (nonatomic,weak) IBOutlet UISegmentedControl *QuestionSelectControl;
@property (nonatomic,weak) IBOutlet UIButton *btnShowNextQuestion;
@property (nonatomic,weak) IBOutlet UIButton *btnShowFinish;

@property (nonatomic) NSUInteger QuestionAnswer;
@property (nonatomic) NSUInteger QuestionSelectItemYes;
@property (nonatomic) NSUInteger QuestionSelectItemNO;


- (IBAction)QuestionSelected:(id)sender;
- (IBAction)Cancel:(id)sender;

- (void)LoadQuestion;
- (void)UpdateQuestionAnswer;


@end

@implementation HISLevelTestViewController

@synthesize LevelTests, QuestionIndex, textViewQuestionTitle, textViewQuestionDesc, imageViewQuestionImage, QuestionSelectControl, btnShowFinish, btnShowNextQuestion, QuestionAnswer, QuestionSelectItemYes, QuestionSelectItemNO;

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
        QuestionSelectItemYes = 0;
        QuestionSelectItemNO = 0;
        
        QuestionSelectItemYes = [[questionItem valueForKey:@"SelectYesValue"] integerValue];
        QuestionSelectItemNO = [[questionItem valueForKey:@"SelectNoValue"] integerValue];

        //加载题目名称及描述
        self.textViewQuestionTitle.text = questionTitle;
        self.textViewQuestionDesc.text = questionDesc;
        
        if (questionImage.length >0)
        {
            //加载图片
            NSString *QuestionImageFullPath = [[NSBundle mainBundle] pathForResource:[questionImage stringByDeletingPathExtension] ofType:[questionImage pathExtension] inDirectory:@"Level_Q/Level_QHIS/Images"];
            
            
            NSLog(@"imageFullPath:%@",QuestionImageFullPath);
            
            self.imageViewQuestionImage.image = [UIImage imageWithContentsOfFile:QuestionImageFullPath];
            
        }
        
        
    }
    
    
}

- (void)UpdateQuestionAnswer
{
    if (QuestionIndex < LevelTests.count)
    {
        NSMutableDictionary *questionItem = [[LevelTests objectAtIndex:QuestionIndex] mutableCopy];
        [questionItem setValue:[NSNumber numberWithInteger:QuestionAnswer]forKey:@"Answer"];
        [LevelTests replaceObjectAtIndex:QuestionIndex withObject:questionItem];
    }
    
}

- (IBAction)QuestionSelected:(id)sender
{
    NSUInteger isSelected = 1;
    
    switch ([QuestionSelectControl selectedSegmentIndex]) {
        case 0://是
            QuestionAnswer = QuestionSelectItemYes;
            break;
        case 1://否
            QuestionAnswer = QuestionSelectItemNO;
            break;

            
        default:
            QuestionAnswer = 0;
            isSelected = 0;
            break;
    }
    
    NSLog(@"QuestionAnswer: %d",QuestionAnswer);
    
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
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_HIS"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            HISLevelTestViewController *testViewController = (HISLevelTestViewController *) [segue destinationViewController];
            testViewController.LevelTests = LevelTests;
            testViewController.QuestionIndex = QuestionIndex + 1;
        }
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowLevelFinishView_HIS"])
    {
        HISLevelFinishViewController *finishViewController = (HISLevelFinishViewController *)[segue destinationViewController];
        finishViewController.LevelTests = LevelTests;
        
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
    
    self.title = [NSString stringWithFormat:@"HIS哈金斯基缺血量表  %d / %d", QuestionIndex, LevelTests.count ];
    
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
