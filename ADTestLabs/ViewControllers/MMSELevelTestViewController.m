//
//  MMSELevelTestViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "MMSELevelTestViewController.h"
#import "MMSELevelFinishViewController.h"
#import "ImageViewerViewController.h"


@interface MMSELevelTestViewController ()

@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionTitle;
@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionDesc;
@property (nonatomic,weak) IBOutlet UIImageView *imageViewQuestionImage;
@property (nonatomic,weak) IBOutlet UISegmentedControl *QuestionSelectControl;
@property (nonatomic,weak) IBOutlet UITextView *textViewQuestionGradingPolicy;
@property (nonatomic,weak) IBOutlet UIButton *btnShowNextQuestion;
@property (nonatomic,weak) IBOutlet UIButton *btnShowFinish;

@property (nonatomic,weak) IBOutlet UIButton *btnShowImageViewer;

@property (nonatomic,strong) UIImage * QuestionImage;

@property (nonatomic) NSUInteger QuestionAnswer;

- (IBAction)QuestionSelected:(id)sender;
- (IBAction)Cancel:(id)sender;

- (void)LoadQuestion;
- (void)UpdateQuestionAnswer;


@end

@implementation MMSELevelTestViewController

@synthesize LevelTests, QuestionIndex, QuestionAnswer;
@synthesize textViewQuestionTitle, textViewQuestionDesc, imageViewQuestionImage, textViewQuestionGradingPolicy;
@synthesize QuestionSelectControl;
@synthesize btnShowFinish, btnShowNextQuestion;

@synthesize QuestionImage,btnShowImageViewer;

#pragma mark - Actions

- (void)LoadQuestion
{
    
    //初始值
    QuestionAnswer = 0;
    
    
    if (QuestionIndex <= LevelTests.count)
    {
 
            btnShowNextQuestion.enabled = NO;
            btnShowNextQuestion.hidden = YES;
            
            btnShowFinish.enabled = NO;
            btnShowFinish.hidden = YES;
      
        
        //根据QuestionIndex 获得当前的Question
        
        NSMutableDictionary * questionItem = [LevelTests objectAtIndex:QuestionIndex-1];
        NSString *questionTitle = [questionItem objectForKey:@"QuestionTitle"];
        NSString *questionDesc = [questionItem objectForKey:@"QuestionDesc"];
        NSString *questionImage = [questionItem objectForKey:@"QuestionImage"];
        NSString *questionGradingPolicy = [questionItem objectForKey:@"GradingPolicy"];
        NSUInteger questionRank = 0;
        questionRank = [[questionItem valueForKey:@"QuestionRank"] integerValue];
        
        //加载题目名称\描述\评分标准
        self.textViewQuestionTitle.text = questionTitle;
        self.textViewQuestionDesc.text = questionDesc;
        self.textViewQuestionGradingPolicy.text = questionGradingPolicy;
        
        
        //加载图片
    
        if (questionImage.length >0)
        {
            
            
            NSString *QuestionImageFullPath = [[NSBundle mainBundle] pathForResource:[questionImage stringByDeletingPathExtension] ofType:[questionImage pathExtension] inDirectory:@"Level_Q/Level_QMMSE/Images"];
            
            self.imageViewQuestionImage.image =  [UIImage imageWithContentsOfFile:QuestionImageFullPath];
            
            QuestionImage = [UIImage imageWithContentsOfFile:QuestionImageFullPath];

            
            //NSLog(@"imageFullPath:%@",QuestionImageFullPath);

            //[UIImage imageNamed:QuestionImageFullPath];
            
            btnShowImageViewer.enabled = true;
            btnShowImageViewer.hidden = false;
        }
        else
        {
            QuestionImage = nil;
            btnShowImageViewer.enabled = false;
            btnShowImageViewer.hidden = true;
        }
 
        
        
        //动态加载评分值
        
        [QuestionSelectControl removeAllSegments];
        
        for ( NSUInteger rank_i = 0; rank_i <= questionRank; rank_i++)
        {
            [QuestionSelectControl insertSegmentWithTitle:[NSString stringWithFormat:@"%d分", rank_i ] atIndex:rank_i animated:NO];
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
    
   // NSLog(@"%d",isSelected);
    
    if ( isSelected == 1)
    {
        btnShowNextQuestion.enabled = YES;
        btnShowNextQuestion.hidden = NO;
        
        
        if (QuestionIndex <LevelTests.count)
        {
            
            
            btnShowNextQuestion.enabled = YES;
            btnShowNextQuestion.hidden = NO;
            
            btnShowFinish.enabled = NO;
            btnShowFinish.hidden = YES;
            
        }
        else
        {
            btnShowNextQuestion.enabled = NO;
            btnShowNextQuestion.hidden = YES;
            
            btnShowFinish.enabled = YES;
            btnShowFinish.hidden = NO;
        }
        
        
    }
    
}

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - View touch

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
 	UITouch *touch=[[event allTouches] anyObject];
	if (touch.view!=self.view) {
		
        NSLog(@"touchesBegan");
        
       // ImageViewerViewController *imageViewer = [[ImageViewerViewController alloc] init];
        
        
        
        //imageViewer =[[UIStoryboard storyboardWithName:@"MainStoryboard"
        //                                           bundle:nil]
        //                 instantiateViewControllerWithIdentifier:@"imageViewerVC"];
        
        
       // [self.view presentedViewController:imageViewer animated:YES];
        
        //ImageViewerViewController *imageViewr =
        
        
        /*[self.view bringSubviewToFront:touch.view];
		float zoom=-25.0;
		CGRect newRect=CGRectInset([touch.view frame], zoom, zoom);
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		[touch.view setFrame:newRect];
		[UIView commitAnimations];
         */
	}
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self UpdateQuestionAnswer];
    
    if ( [[segue identifier] isEqualToString:@"ShowLevelTestNextView_MMSE"])
    {
        if (QuestionIndex < LevelTests.count)
        {
            MMSELevelTestViewController *testViewController = (MMSELevelTestViewController *) [segue destinationViewController];
            testViewController.LevelTests = LevelTests;
            testViewController.QuestionIndex = QuestionIndex + 1;
        }
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowLevelFinishView_MMSE"])
    {
        MMSELevelFinishViewController *finishViewController = (MMSELevelFinishViewController *)[segue destinationViewController];
        finishViewController.LevelTests = LevelTests;
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowImageViewer"])
    {
    
        ImageViewerViewController *imageViewerViewController = (ImageViewerViewController *)[segue destinationViewController];
        
        imageViewerViewController.showImage = QuestionImage;
        
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
    
    self.title = [NSString stringWithFormat:@"MMSE简易智能精神状态检查量表  %d / %d", QuestionIndex, LevelTests.count ];
    
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
