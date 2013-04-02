//
//  HAMNDLevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-1.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HAMNDLevelTestViewController.h"
#import "HAMNDLevelFinishViewController.h"

@interface HAMNDLevelTestViewController ()

@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionTitle;
@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionDesc;
@property (nonatomic,weak) IBOutlet UIImageView *imageViewQuestionImage;
@property (nonatomic,weak) IBOutlet UISegmentedControl *QuestionSelectControl;
@property (nonatomic,weak) IBOutlet UIButton *btnShowNextQuestion;
@property (nonatomic,weak) IBOutlet UIButton *btnShowFinish;

@property (nonatomic,weak) IBOutlet UILabel *labelQuestionRankDesc1;
@property (nonatomic,weak) IBOutlet UILabel *labelQuestionRankDesc2;
@property (nonatomic,weak) IBOutlet UILabel *labelQuestionRankDesc3;
@property (nonatomic,weak) IBOutlet UILabel *labelQuestionRankDesc4;
@property (nonatomic,weak) IBOutlet UILabel *labelQuestionRankDesc5;



@property (nonatomic) NSUInteger QuestionAnswer;

- (IBAction)QuestionSelected:(id)sender;
- (IBAction)Cancel:(id)sender;

- (void)LoadQuestion;
- (void)UpdateQuestionAnswer;



@end

@implementation HAMNDLevelTestViewController

@synthesize LevelTests, QuestionIndex, textViewQuestionTitle, QuestionSelectControl, btnShowFinish, btnShowNextQuestion, QuestionAnswer, textViewQuestionDesc, imageViewQuestionImage;
@synthesize labelQuestionRankDesc1, labelQuestionRankDesc2, labelQuestionRankDesc3, labelQuestionRankDesc4, labelQuestionRankDesc5;

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
        NSUInteger questionRank = 0;
        questionRank = [[questionItem valueForKey:@"QuestionRank"] integerValue];
        
        NSMutableDictionary *questionRankDesc = [questionItem objectForKey:@"QuestionRankDesc"];
        
        
        
        //加载题目名称及描述
        self.textViewQuestionTitle.text = questionTitle;
        self.textViewQuestionDesc.text = questionDesc;
        
        if (questionImage.length >0)
        {
            //加载图片
            NSString *QuestionImageFullPath = [[NSBundle mainBundle] pathForResource:[questionImage stringByDeletingPathExtension] ofType:[questionImage pathExtension] inDirectory:@"Level_Q/Level_QHAMND/Images"];
            
            
            NSLog(@"imageFullPath:%@",QuestionImageFullPath);
            
            self.imageViewQuestionImage.image = [UIImage imageWithContentsOfFile:QuestionImageFullPath];
        }
        
        
        //动态显示评分标准描述


        
        
        
        
        
        
        //动态加载评分值
        
        [QuestionSelectControl removeAllSegments];
        
        switch (questionRank) {
            case 3:
                
                labelQuestionRankDesc1.text = [NSString stringWithFormat:@"         无：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",0]]];
                                              
                labelQuestionRankDesc2.text = [NSString stringWithFormat:@"轻-中度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",1]]];
                
                labelQuestionRankDesc3.text = [NSString stringWithFormat:@"     重度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",2]]];
                
                labelQuestionRankDesc4.text = [NSString stringWithFormat:@""];
                labelQuestionRankDesc5.text = [NSString stringWithFormat:@""];
                            
                [QuestionSelectControl insertSegmentWithTitle:@"  无  " atIndex:0 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@"轻-中度" atIndex:1 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@" 重度 " atIndex:2 animated:NO];
                
                
                break;
            case 5:
                
                labelQuestionRankDesc1.text = [NSString stringWithFormat:@"        无：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",0]]];
                
                labelQuestionRankDesc2.text = [NSString stringWithFormat:@"    轻度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",1]]];
                
                labelQuestionRankDesc3.text = [NSString stringWithFormat:@"    中度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",2]]];
                
                labelQuestionRankDesc4.text = [NSString stringWithFormat:@"    重度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",3]]];
                
                labelQuestionRankDesc5.text = [NSString stringWithFormat:@"极重度：%@", [ questionRankDesc objectForKey:[NSString stringWithFormat:@"%d",4]]];
                
                
                
                [QuestionSelectControl insertSegmentWithTitle:@"  无  " atIndex:0 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@" 轻度 " atIndex:1 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@" 中度 " atIndex:2 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@" 重度 " atIndex:3 animated:NO];
                [QuestionSelectControl insertSegmentWithTitle:@" 极重度 " atIndex:4 animated:NO];
            default:
                break;
        }
        
        //for ( NSUInteger rank_i = 0; rank_i <= questionRank ; rank_i++)
        //{
        //    [QuestionSelectControl insertSegmentWithTitle:[NSString stringWithFormat:@"%d分",rank_i] atIndex:rank_i animated:NO];
        //}
        
                
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
        case 0:
            QuestionAnswer = 0;
            break;
        case 1:
            QuestionAnswer = 1;
            break;
        case 2:
            QuestionAnswer = 2;
            break;
        case 3:
            QuestionAnswer = 3;
            break;
        case 4:
            QuestionAnswer = 4;
            break;
        case 5:
            QuestionAnswer = 5;
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
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_HAMND"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            HAMNDLevelTestViewController *testViewController = (HAMNDLevelTestViewController *) [segue destinationViewController];
            testViewController.LevelTests = LevelTests;
            testViewController.QuestionIndex = QuestionIndex + 1;
        }
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowLevelFinishView_HAMND"])
    {
        HAMNDLevelFinishViewController *finishViewController = (HAMNDLevelFinishViewController *)[segue destinationViewController];
        finishViewController.LevelTests = LevelTests;
        
    }
    
}

#pragma mark - Viewcyle

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
    
    self.title = [NSString stringWithFormat:@"HAMND汉密尔顿抑郁量表  %d / %d", QuestionIndex, LevelTests.count ];
    
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
