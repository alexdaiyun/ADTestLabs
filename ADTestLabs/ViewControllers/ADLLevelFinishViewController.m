//
//  ADLLevelFinishViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADLLevelFinishViewController.h"

@interface ADLLevelFinishViewController ()


@property (nonatomic, retain) IBOutlet UIButton *btnShowAroundInfo;
@property (nonatomic, weak) IBOutlet UITextView *textViewReport;

- (IBAction)Cancel:(id)sender;

- (IBAction)ShowAroundInfo:(id)sender;


- (void)CompleteQuestionScore;


@end


@implementation ADLLevelFinishViewController


@synthesize LevelTests,btnShowAroundInfo,textViewReport;

#pragma mark - Actions


- (void)CompleteQuestionScore
{
    NSUInteger score = 0;
    NSString *reportText = @"";
    
    NSUInteger subTotle_A = 0;
    NSUInteger subTotle_B = 0;
    NSUInteger subTotle_C = 0;
    NSUInteger subTotle_D = 0;
    
    //计算分数值
    for (NSMutableDictionary *Item in LevelTests)
    {
        NSUInteger questionAnswer = [[Item objectForKey:@"Answer"] integerValue];
        score =  questionAnswer + score;
        switch (questionAnswer) {
            case 1:
                subTotle_A = subTotle_A +1;
                break;
            case 2:
                subTotle_B = subTotle_B +1;
                break;
            case 3:
                subTotle_C = subTotle_C +1;
                break;
            case 4:
                subTotle_D = subTotle_D +1;
                break;
            default:
                break;
        }
        
        
    }
    
    
    NSLog(@"score%d",score );
    
    if (score < 23)
    {
        reportText = @"恭喜您，本次测试结果显示您（或您的家属）目前没有日常生活能力方面的问题！";
        
    }
    else
    {
        
        reportText = @"本次测评结果显示被测试者的日常生活能力存在明显困难。";
        
 
        
    }
 
    
    
    textViewReport.text = reportText;
    
    ADTLabs_ScaleReportBLL *_scaleReportBLL = [[ADTLabs_ScaleReportBLL alloc]init];
    
    
    ADTLabs_AppDelegate *_appDelegate = [ UIApplication sharedApplication].delegate;
    
    
    
    if (_appDelegate.user != nil)
    {
        [_scaleReportBLL AddScaleReport:_appDelegate.user
         .userID withAnswer:nil withScore:score withScaleReportDesc:reportText withScaleLevelTag:ScaleLevelADL];
    }
    
}

- (IBAction)ShowAroundInfo:(id)sender
{
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"消息提示"];
	[alert setMessage:@"此功能正在开发中，敬请期待！"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"确定"];
	//[alert addButtonWithTitle:@"No"];
	[alert show];
    
    
    
    
}


- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - HospitalLocationMapViewControllerDelegate

-(void)hospitalLocationMapViewControllerDidCancel:(HospitalLocationMapViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([[segue identifier] isEqualToString:@"ADLLevelToShowHospitalLocationMapView"])
    {
        HospitalLocationMapViewController *destination_Controller = segue.destinationViewController;
        
        destination_Controller.delegate = self;
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
    [self CompleteQuestionScore];
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
